resource "azurerm_resource_group" "landing" {
  name     = "landing-page-rg"
  location = var.location
}

resource "terraform_data" "cd_webhook_trigger" {
  input = var.spacelift_commit_sha
}

# ============================================================================
# Azure Static Web App
# ============================================================================

resource "azurerm_static_web_app" "landing" {
  name                = "landing-page-app"
  resource_group_name = azurerm_resource_group.landing.name
  location            = azurerm_resource_group.landing.location
  sku_tier            = "Free"
  sku_size            = "Free"

  lifecycle {
    ignore_changes = [
      repository_url,
      repository_branch
    ]
  }
}

# ============================================================================
# DNS — Apex domain (romaine.life)
# ============================================================================

resource "azurerm_dns_txt_record" "landing_validation" {
  name                = "@"
  zone_name           = var.infra_dns_zone_name
  resource_group_name = var.infra_resource_group_name
  ttl                 = 3600

  record {
    value = azurerm_static_web_app.landing.default_host_name
  }
}

resource "azurerm_dns_a_record" "landing_apex" {
  name                = "@"
  zone_name           = var.infra_dns_zone_name
  resource_group_name = var.infra_resource_group_name
  ttl                 = 3600
  target_resource_id  = azurerm_static_web_app.landing.id
}

resource "azurerm_static_web_app_custom_domain" "landing" {
  static_web_app_id = azurerm_static_web_app.landing.id
  domain_name       = var.infra_dns_zone_name
  validation_type   = "dns-txt-token"
  depends_on        = [azurerm_dns_txt_record.landing_validation]
}
