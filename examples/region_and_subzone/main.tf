terraform {
  required_version = "~> 1.6"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

module "avm-utl-regions" {
  source          = "Azure/avm-utl-regions/azurerm"
  version         = "0.3.0"
  use_cached_data = true
}

resource "random_integer" "region_index" {
  max = length(module.avm-utl-regions.regions) - 1
  min = 0
}

resource "random_string" "subzone" {
  special = false
  lower   = true
  upper   = false
  numeric = false
  length  = 10 # The subzone limit is 32
}

module "azure_private_dns_zones" {
  source      = "../.."
  region_name = module.avm-utl-regions.regions[random_integer.region_index.result].name
  subzone     = random_string.subzone.result
}

output "kubernetes_cluster" {
  value = module.azure_private_dns_zones.kubernetes_cluster
}

output "container_registry" {
  value = module.azure_private_dns_zones.container_registry
}

output "automation_account" {
  value = module.azure_private_dns_zones.automation_account
}
