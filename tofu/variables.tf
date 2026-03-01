# ============================================================================
# Application Variables
# ============================================================================

variable "location" {
  description = "Azure region where the resource group will be created"
  type        = string
  default     = "westus2"
}

variable "spacelift_commit_sha" {
  description = "The Git SHA passed dynamically from Spacelift to force an apply"
  type        = string
}

# ============================================================================
# Shared Infrastructure Variables (injected via Spacelift stack dependencies)
# ============================================================================

variable "infra_resource_group_name" {
  description = "Name of the shared resource group"
  type        = string
}

variable "infra_dns_zone_name" {
  description = "Name of the shared DNS zone"
  type        = string
}
