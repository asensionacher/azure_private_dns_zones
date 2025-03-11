module "dns" {
  source = "./.."

}

output "attestation_provider" {
  value = module.dns.attestation_provider["standard"]

}
