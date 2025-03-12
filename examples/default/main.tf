module "azure_private_dns_zones" {
  source = "../.."
}

output "attestation_provider" {
  value = module.azure_private_dns_zones.attestation_provider
}

output "attestation_provider_standard" {
  value = module.azure_private_dns_zones.attestation_provider["standard"]
}

output "attestation_provider_standard_dns" {
  value = module.azure_private_dns_zones.attestation_provider["standard"].private_dns_zone_names
}

output "storage_account" {
  value = module.azure_private_dns_zones.storage_account
}

output "storage_account_dns" {
  value = toset(flatten([for v in values(module.azure_private_dns_zones.storage_account) : v.private_dns_zone_names]))
}

output "storage_account_blob" {
  value = module.azure_private_dns_zones.storage_account["blob"]
}

output "storage_account_blob_dns" {
  value = module.azure_private_dns_zones.storage_account["blob"].private_dns_zone_names
}

