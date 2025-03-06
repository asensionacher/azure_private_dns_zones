output "machine_learning_workspace" {
  value       = local.az.machine_learning_workspace
  description = "Machine Learning Workspace"
}

output "azurerm_ai_services" {
  value       = local.az.azurerm_ai_services
  description = "Azurerm Ai Services"
}

output "bot_service_azure_bot" {
  value       = local.az.bot_service_azure_bot
  description = "Bot Service Azure Bot"
}

output "synapse_workspace" {
  value       = local.az.synapse_workspace
  description = "Synapse Workspace"
}

output "synapse_private_link_hub" {
  value       = local.az.synapse_private_link_hub
  description = "Synapse Private Link Hub"
}

output "eventhub" {
  value       = local.az.eventhub
  description = "Eventhub"
}

output "servicebus_namespace" {
  value       = local.az.servicebus_namespace
  description = "Servicebus Namespace"
}

output "data_factory" {
  value       = local.az.data_factory
  description = "Data Factory"
}

output "hdinsight_hadoop_cluster" {
  value       = local.az.hdinsight_hadoop_cluster
  description = "Hdinsight Hadoop Cluster"
}

output "hdinsight_hbase_cluster" {
  value       = local.az.hdinsight_hbase_cluster
  description = "Hdinsight Hbase Cluster"
}

output "hdinsight_kafka_cluster" {
  value       = local.az.hdinsight_kafka_cluster
  description = "Hdinsight Kafka Cluster"
}

output "hdinsight_spark_cluster" {
  value       = local.az.hdinsight_spark_cluster
  description = "Hdinsight Spark Cluster"
}

output "hdinsight_interactive_query_cluster" {
  value       = local.az.hdinsight_interactive_query_cluster
  description = "Hdinsight Interactive Query Cluster"
}

output "kusto_cluster" {
  value       = local.az.kusto_cluster
  description = "Kusto Cluster"
}

output "databricks_workspace" {
  value       = local.az.databricks_workspace
  description = "Databricks Workspace"
}

output "batch_account" {
  value       = local.az.batch_account
  description = "Batch Account"
}

output "virtual_desktop_workspace" {
  value       = local.az.virtual_desktop_workspace
  description = "Virtual Desktop Workspace"
}

output "virtual_desktop_host_pool" {
  value       = local.az.virtual_desktop_host_pool
  description = "Virtual Desktop Host Pool"
}

output "kubernetes_cluster" {
  value       = local.az.kubernetes_cluster
  description = "Kubernetes Cluster"
}

output "container_app" {
  value       = local.az.container_app
  description = "Container App"
}

output "container_registry" {
  value       = local.az.container_registry
  description = "Container Registry"
}

output "mssql_server" {
  value       = local.az.mssql_server
  description = "Mssql Server"
}

output "mssql_managed_instance" {
  value       = local.az.mssql_managed_instance
  description = "Mssql Managed Instance"
}

output "cosmosdb_account" {
  value       = local.az.cosmosdb_account
  description = "Cosmosdb Account"
}

output "postgresql_server" {
  value       = local.az.postgresql_server
  description = "Postgresql Server"
}

output "postgresql_flexible_server" {
  value       = local.az.postgresql_flexible_server
  description = "Postgresql Flexible Server"
}

output "mysql_flexible_server" {
  value       = local.az.mysql_flexible_server
  description = "Mysql Flexible Server"
}

output "redis_cache" {
  value       = local.az.redis_cache
  description = "Redis Cache"
}

output "redis_enterprise_cluster" {
  value       = local.az.redis_enterprise_cluster
  description = "Redis Enterprise Cluster"
}

output "arc_private_link_scope" {
  value       = local.az.arc_private_link_scope
  description = "Arc Private Link Scope"
}

output "eventgrid_topic" {
  value       = local.az.eventgrid_topic
  description = "Eventgrid Topic"
}

output "eventgrid_domain" {
  value       = local.az.eventgrid_domain
  description = "Eventgrid Domain"
}

output "eventgrid_namespace" {
  value       = local.az.eventgrid_namespace
  description = "Eventgrid Namespace"
}

output "api_management" {
  value       = local.az.api_management
  description = "Api Management"
}

output "healthcare_workspace" {
  value       = local.az.healthcare_workspace
  description = "Healthcare Workspace"
}

output "iothub" {
  value       = local.az.iothub
  description = "Iothub"
}

output "iothub_dps" {
  value       = local.az.iothub_dps
  description = "Iothub Dps"
}

output "iothub_device_update_account" {
  value       = local.az.iothub_device_update_account
  description = "Iothub Device Update Account"
}

output "iotcentral_application" {
  value       = local.az.iotcentral_application
  description = "Iotcentral Application"
}

output "digital_twins_instance" {
  value       = local.az.digital_twins_instance
  description = "Digital Twins Instance"
}

output "automation_account" {
  value       = local.az.automation_account
  description = "Automation Account"
}

output "recovery_services_vault" {
  value       = local.az.recovery_services_vault
  description = "Recovery Services Vault"
}

output "monitor_private_link_scope" {
  value       = local.az.monitor_private_link_scope
  description = "Monitor Private Link Scope"
}

output "purview_account" {
  value       = local.az.purview_account
  description = "Purview Account"
}

output "resource_management_private_link" {
  value       = local.az.resource_management_private_link
  description = "Resource Management Private Link"
}

output "dashboard_grafana" {
  value       = local.az.dashboard_grafana
  description = "Dashboard Grafana"
}

output "key_vault" {
  value       = local.az.key_vault
  description = "Key Vault"
}

output "app_configuration" {
  value       = local.az.app_configuration
  description = "App Configuration"
}

output "attestation_provider" {
  value       = local.az.attestation_provider
  description = "Attestation Provider"
}

output "storage_account" {
  value       = local.az.storage_account
  description = "Storage Account"
}

output "storage_sync" {
  value       = local.az.storage_sync
  description = "Storage Sync"
}

output "managed_disk" {
  value       = local.az.managed_disk
  description = "Managed Disk"
}

output "search_service" {
  value       = local.az.search_service
  description = "Search Service"
}

output "relay_namespace" {
  value       = local.az.relay_namespace
  description = "Relay Namespace"
}

output "linux_function_app" {
  value       = local.az.linux_function_app
  description = "Linux Function App"
}

output "windows_function_app" {
  value       = local.az.windows_function_app
  description = "Windows Function App"
}

output "signalr_service" {
  value       = local.az.signalr_service
  description = "Signalr Service"
}

output "static_web_app" {
  value       = local.az.static_web_app
  description = "Static Web App"
}

output "web_pubsub" {
  value       = local.az.web_pubsub
  description = "Web Pubsub"
}


