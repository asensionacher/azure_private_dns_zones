# Azure Private DNS Zones helper

This module helps you to easily deploy Private DNS zones for Azure private endpoints for Terraform without havingsub to remember or going into the documentation to check the zone names. The goal of this module is that for each resource you need to deploy the Private DNS zones you will be easily able to get this name for being used to deploy the resource and be sure you are not having any error on the name or the subresource.

## Usage

For every resource in `terraform_azurerm`just remove the `azurerm` part of the module and use the different properties of this output. Following [Azure Private Endpoint private DNS zone values Microsoft documentation](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-dns), some private DNS zones needs a `dns_prefix`, `instance_name`, `partition_id`, `region_name` or `subzone` so add it into the variables if needed. If those values are not setted, the default value will be applied like in the Microsoft documentation appears (see [Inputs](#Inputs) for more information).

An example for deploying an storage account with Private DNS Zone for blob, private endpoints and all the necessary resources could be:

```hcl
locals {
  # Get unique private dns zones
  unique_private_dns_zone_names = { for zone in module.azurerm_private_dns_zones.storage_account.subresources : zone.name => zone.private_dns_zone_names }
}
output "local" {
  value = local.unique_private_dns_zone_names
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "spaincentral"
}

# Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Subnet 1
resource "azurerm_subnet" "private_endpoint" {
  name                 = "privateEndpointSubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

module "azurerm_private_dns_zones" {
  source      = "./.."
  region_name = "spaincentral"
}

resource "azurerm_private_dns_zone" "blob" {
  name                = local.unique_private_dns_zone_names["blob"][0]
  resource_group_name = "example-rg"
}

resource "azurerm_private_dns_zone_virtual_network_link" "blob" {
  name                  = "link-to-${azurerm_virtual_network.example.name}"
  resource_group_name   = azurerm_resource_group.example.name
  private_dns_zone_name = azurerm_private_dns_zone.blob.name
  virtual_network_id    = azurerm_virtual_network.example.id
}

resource "azurerm_private_endpoint" "blob" {
  name                = "private-endpoint-01"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.private_endpoint.id

  private_service_connection {
    name                           = "blob-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.example.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "blob-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.blob.id]
  }
  depends_on = [azurerm_private_dns_zone_virtual_network_link.blob]
}

resource "azurerm_private_endpoint" "blob_secondary" {
  name                = "private-endpoint-02"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.private_endpoint.id

  private_service_connection {
    name                           = "blob-secondary-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.example.id
    subresource_names              = ["blob_secondary"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "blob-secondary-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.blob.id]
  }
  depends_on = [azurerm_private_dns_zone_virtual_network_link.blob]
}
```

