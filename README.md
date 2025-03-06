<!-- BEGIN_TF_DOCS -->
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

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Refers to the DNS Previx name of the resource you are deploying. If not informed, <br/>        the default value `{dnsPrefix}` will be setted, <br/>        so remember to assign the correct value when retreiving the outputs. | `string` | `"{dnsPrefix}"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Refers to the instance name of the resource you are deploying. If not informed, <br/>        the default value `{instanceName}` will be setted, <br/>        so remember to assign the correct value when retreiving the outputs. | `string` | `"{instanceName}"` | no |
| <a name="input_partition_id"></a> [partition\_id](#input\_partition\_id) | Refers to the partition id of the resource you are deploying. If not informed, <br/>        the default value `{partitionId}` will be setted, <br/>        so remember to assign the correct value when retreiving the outputs. | `string` | `"{partitionId}"` | no |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Refers to the full region name (for example, eastus for East US and <br/>    northeurope for North Europe).<br/><br/>    If no value is setted, the default value `{regionName}` will be setted, <br/>    so remember to assign the correct value when retreiving the outputs.<br/><br/>    The `{regionCode}` will be neither informed, so remember to<br/>    assign the correct value when retreiving the outputs. | `string` | `"{regionName}"` | no |
| <a name="input_subzone"></a> [subzone](#input\_subzone) | Refers to the Subzone name of the resource you are deploying. If not informed, <br/>        the default value `{subzone}` will be setted, <br/>        so remember to assign the correct value when retreiving the outputs. | `string` | `"{subzone}"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_management"></a> [api\_management](#output\_api\_management) | Api Management |
| <a name="output_app_configuration"></a> [app\_configuration](#output\_app\_configuration) | App Configuration |
| <a name="output_arc_private_link_scope"></a> [arc\_private\_link\_scope](#output\_arc\_private\_link\_scope) | Arc Private Link Scope |
| <a name="output_attestation_provider"></a> [attestation\_provider](#output\_attestation\_provider) | Attestation Provider |
| <a name="output_automation_account"></a> [automation\_account](#output\_automation\_account) | Automation Account |
| <a name="output_azurerm_ai_services"></a> [azurerm\_ai\_services](#output\_azurerm\_ai\_services) | Azurerm Ai Services |
| <a name="output_batch_account"></a> [batch\_account](#output\_batch\_account) | Batch Account |
| <a name="output_bot_service_azure_bot"></a> [bot\_service\_azure\_bot](#output\_bot\_service\_azure\_bot) | Bot Service Azure Bot |
| <a name="output_container_app"></a> [container\_app](#output\_container\_app) | Container App |
| <a name="output_container_registry"></a> [container\_registry](#output\_container\_registry) | Container Registry |
| <a name="output_cosmosdb_account"></a> [cosmosdb\_account](#output\_cosmosdb\_account) | Cosmosdb Account |
| <a name="output_dashboard_grafana"></a> [dashboard\_grafana](#output\_dashboard\_grafana) | Dashboard Grafana |
| <a name="output_data_factory"></a> [data\_factory](#output\_data\_factory) | Data Factory |
| <a name="output_databricks_workspace"></a> [databricks\_workspace](#output\_databricks\_workspace) | Databricks Workspace |
| <a name="output_digital_twins_instance"></a> [digital\_twins\_instance](#output\_digital\_twins\_instance) | Digital Twins Instance |
| <a name="output_eventgrid_domain"></a> [eventgrid\_domain](#output\_eventgrid\_domain) | Eventgrid Domain |
| <a name="output_eventgrid_namespace"></a> [eventgrid\_namespace](#output\_eventgrid\_namespace) | Eventgrid Namespace |
| <a name="output_eventgrid_topic"></a> [eventgrid\_topic](#output\_eventgrid\_topic) | Eventgrid Topic |
| <a name="output_eventhub"></a> [eventhub](#output\_eventhub) | Eventhub |
| <a name="output_hdinsight_hadoop_cluster"></a> [hdinsight\_hadoop\_cluster](#output\_hdinsight\_hadoop\_cluster) | Hdinsight Hadoop Cluster |
| <a name="output_hdinsight_hbase_cluster"></a> [hdinsight\_hbase\_cluster](#output\_hdinsight\_hbase\_cluster) | Hdinsight Hbase Cluster |
| <a name="output_hdinsight_interactive_query_cluster"></a> [hdinsight\_interactive\_query\_cluster](#output\_hdinsight\_interactive\_query\_cluster) | Hdinsight Interactive Query Cluster |
| <a name="output_hdinsight_kafka_cluster"></a> [hdinsight\_kafka\_cluster](#output\_hdinsight\_kafka\_cluster) | Hdinsight Kafka Cluster |
| <a name="output_hdinsight_spark_cluster"></a> [hdinsight\_spark\_cluster](#output\_hdinsight\_spark\_cluster) | Hdinsight Spark Cluster |
| <a name="output_healthcare_workspace"></a> [healthcare\_workspace](#output\_healthcare\_workspace) | Healthcare Workspace |
| <a name="output_iotcentral_application"></a> [iotcentral\_application](#output\_iotcentral\_application) | Iotcentral Application |
| <a name="output_iothub"></a> [iothub](#output\_iothub) | Iothub |
| <a name="output_iothub_device_update_account"></a> [iothub\_device\_update\_account](#output\_iothub\_device\_update\_account) | Iothub Device Update Account |
| <a name="output_iothub_dps"></a> [iothub\_dps](#output\_iothub\_dps) | Iothub Dps |
| <a name="output_key_vault"></a> [key\_vault](#output\_key\_vault) | Key Vault |
| <a name="output_kubernetes_cluster"></a> [kubernetes\_cluster](#output\_kubernetes\_cluster) | Kubernetes Cluster |
| <a name="output_kusto_cluster"></a> [kusto\_cluster](#output\_kusto\_cluster) | Kusto Cluster |
| <a name="output_linux_function_app"></a> [linux\_function\_app](#output\_linux\_function\_app) | Linux Function App |
| <a name="output_machine_learning_workspace"></a> [machine\_learning\_workspace](#output\_machine\_learning\_workspace) | Machine Learning Workspace |
| <a name="output_managed_disk"></a> [managed\_disk](#output\_managed\_disk) | Managed Disk |
| <a name="output_monitor_private_link_scope"></a> [monitor\_private\_link\_scope](#output\_monitor\_private\_link\_scope) | Monitor Private Link Scope |
| <a name="output_mssql_managed_instance"></a> [mssql\_managed\_instance](#output\_mssql\_managed\_instance) | Mssql Managed Instance |
| <a name="output_mssql_server"></a> [mssql\_server](#output\_mssql\_server) | Mssql Server |
| <a name="output_mysql_flexible_server"></a> [mysql\_flexible\_server](#output\_mysql\_flexible\_server) | Mysql Flexible Server |
| <a name="output_postgresql_flexible_server"></a> [postgresql\_flexible\_server](#output\_postgresql\_flexible\_server) | Postgresql Flexible Server |
| <a name="output_postgresql_server"></a> [postgresql\_server](#output\_postgresql\_server) | Postgresql Server |
| <a name="output_purview_account"></a> [purview\_account](#output\_purview\_account) | Purview Account |
| <a name="output_recovery_services_vault"></a> [recovery\_services\_vault](#output\_recovery\_services\_vault) | Recovery Services Vault |
| <a name="output_redis_cache"></a> [redis\_cache](#output\_redis\_cache) | Redis Cache |
| <a name="output_redis_enterprise_cluster"></a> [redis\_enterprise\_cluster](#output\_redis\_enterprise\_cluster) | Redis Enterprise Cluster |
| <a name="output_relay_namespace"></a> [relay\_namespace](#output\_relay\_namespace) | Relay Namespace |
| <a name="output_resource_management_private_link"></a> [resource\_management\_private\_link](#output\_resource\_management\_private\_link) | Resource Management Private Link |
| <a name="output_search_service"></a> [search\_service](#output\_search\_service) | Search Service |
| <a name="output_servicebus_namespace"></a> [servicebus\_namespace](#output\_servicebus\_namespace) | Servicebus Namespace |
| <a name="output_signalr_service"></a> [signalr\_service](#output\_signalr\_service) | Signalr Service |
| <a name="output_static_web_app"></a> [static\_web\_app](#output\_static\_web\_app) | Static Web App |
| <a name="output_storage_account"></a> [storage\_account](#output\_storage\_account) | Storage Account |
| <a name="output_storage_sync"></a> [storage\_sync](#output\_storage\_sync) | Storage Sync |
| <a name="output_synapse_private_link_hub"></a> [synapse\_private\_link\_hub](#output\_synapse\_private\_link\_hub) | Synapse Private Link Hub |
| <a name="output_synapse_workspace"></a> [synapse\_workspace](#output\_synapse\_workspace) | Synapse Workspace |
| <a name="output_virtual_desktop_host_pool"></a> [virtual\_desktop\_host\_pool](#output\_virtual\_desktop\_host\_pool) | Virtual Desktop Host Pool |
| <a name="output_virtual_desktop_workspace"></a> [virtual\_desktop\_workspace](#output\_virtual\_desktop\_workspace) | Virtual Desktop Workspace |
| <a name="output_web_pubsub"></a> [web\_pubsub](#output\_web\_pubsub) | Web Pubsub |
| <a name="output_windows_function_app"></a> [windows\_function\_app](#output\_windows\_function\_app) | Windows Function App |

*Made with ❤️ by Sergi Asensio, part of **Bossard AG Schweiz**, clearly influenced by [terraform-azurerm-naming module](https://github.com/Azure/terraform-azurerm-naming).*
<!-- END_TF_DOCS -->