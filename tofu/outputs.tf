output "resource_group_name" {
  value       = azurerm_resource_group.landing.name
  description = "Name of the resource group"
}

output "static_web_app_name" {
  value       = azurerm_static_web_app.landing.name
  description = "Name of the Azure Static Web App"
}

output "static_web_app_hostname" {
  value       = var.infra_dns_zone_name
  description = "Custom domain hostname of the Static Web App"
}
