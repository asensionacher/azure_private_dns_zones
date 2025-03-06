locals {
  region_code = lower(lookup(local.region_code_map, var.region_name, "{regionCode}"))
  az = {
    "machine_learning_workspace" = {
      subresources = [
        {
          name = "amlworkspace"
          private_dns_zone_names = [
            "privatelink.api.azureml.ms",
            "privatelink.notebooks.azure.net"
          ]
          public_dns_zone_forwarders = [
            "api.azureml.ms",
            "notebooks.azure.net",
            "instances.azureml.ms",
            "aznbcontent.net",
            "inference.ml.azure.com"
          ]
        },
      ]
    },
    "azurerm_ai_services" = {
      subresources = [
        {
          name = "account"
          private_dns_zone_names = [
            "privatelink.cognitiveservices.azure.com",
            "privatelink.openai.azure.com",
            "privatelink.services.ai.azure.com"
          ]
          public_dns_zone_forwarders = [
            "cognitiveservices.azure.com",
            "openai.azure.com",
            "services.ai.azure.com"
          ]
        },
      ]
    },
    "bot_service_azure_bot" = {
      subresources = [
        {
          name = "Bot"
          private_dns_zone_names = [
            "privatelink.directline.botframework.com"
          ]
          public_dns_zone_forwarders = [
            "directline.botframework.com"
          ]
        },
        {
          name = "Token"
          private_dns_zone_names = [
            "privatelink.token.botframework.com"
          ]
          public_dns_zone_forwarders = [
            "token.botframework.com"
          ]
        },
      ]
    },
    "synapse_workspace" = {
      subresources = [
        {
          name = "Sql"
          private_dns_zone_names = [
            "privatelink.sql.azuresynapse.net"
          ]
          public_dns_zone_forwarders = [
            "sql.azuresynapse.net"
          ]
        },
        {
          name = "SqlOnDemand"
          private_dns_zone_names = [
            "privatelink.sql.azuresynapse.net"
          ]
          public_dns_zone_forwarders = [
            "sql.azuresynapse.net"
          ]
        },
        {
          name = "Dev"
          private_dns_zone_names = [
            "privatelink.dev.azuresynapse.net"
          ]
          public_dns_zone_forwarders = [
            "dev.azuresynapse.net"
          ]
        },
      ]
    },
    "synapse_private_link_hub" = {
      subresources = [
        {
          name = "Web"
          private_dns_zone_names = [
            "privatelink.azuresynapse.net"
          ]
          public_dns_zone_forwarders = [
            "azuresynapse.net"
          ]
        },
      ]
    },
    "eventhub" = {
      subresources = [
        {
          name = "namespace"
          private_dns_zone_names = [
            "privatelink.servicebus.windows.net"
          ]
          public_dns_zone_forwarders = [
            "servicebus.windows.net"
          ]
        },
      ]
    },
    "servicebus_namespace" = {
      subresources = [
        {
          name = "namespace"
          private_dns_zone_names = [
            "privatelink.servicebus.windows.net"
          ]
          public_dns_zone_forwarders = [
            "servicebus.windows.net"
          ]
        },
      ]
    },
    "data_factory" = {
      subresources = [
        {
          name = "dataFactory"
          private_dns_zone_names = [
            "privatelink.datafactory.azure.net"
          ]
          public_dns_zone_forwarders = [
            "datafactory.azure.net"
          ]
        },
        {
          name = "portal"
          private_dns_zone_names = [
            "privatelink.adf.azure.com"
          ]
          public_dns_zone_forwarders = [
            "adf.azure.com"
          ]
        },
      ]
    },
    "hdinsight_hadoop_cluster" = {
      subresources = [
        {
          name = "gateway"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
        {
          name = "headnode"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
      ]
    },
    "hdinsight_hbase_cluster" = {
      subresources = [
        {
          name = "gateway"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
        {
          name = "headnode"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
      ]
    },
    "hdinsight_kafka_cluster" = {
      subresources = [
        {
          name = "gateway"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
        {
          name = "headnode"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
      ]
    },
    "hdinsight_spark_cluster" = {
      subresources = [
        {
          name = "gateway"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
        {
          name = "headnode"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
      ]
    },
    "hdinsight_interactive_query_cluster" = {
      subresources = [
        {
          name = "gateway"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
        {
          name = "headnode"
          private_dns_zone_names = [
            "privatelink.azurehdinsight.net"
          ]
          public_dns_zone_forwarders = [
            "azurehdinsight.net"
          ]
        },
      ]
    },
    "kusto_cluster" = {
      subresources = [
        {
          name = "cluster"
          private_dns_zone_names = [
            replace("privatelink.{regionName}.kusto.windows.net", "{regionName}", var.region_name),
            "privatelink.blob.core.windows.net",
            "privatelink.queue.core.windows.net",
            "privatelink.table.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            replace("{regionName}.kusto.windows.net", "{regionName}", var.region_name),
            "blob.core.windows.net",
            "queue.core.windows.net",
            "table.core.windows.net"
          ]
        },
      ]
    },
    "databricks_workspace" = {
      subresources = [
        {
          name = "databricks_ui_api"
          private_dns_zone_names = [
            "privatelink.azuredatabricks.net"
          ]
          public_dns_zone_forwarders = [
            "azuredatabricks.net"
          ]
        },
        {
          name = "browser_authentication"
          private_dns_zone_names = [
            "privatelink.azuredatabricks.net"
          ]
          public_dns_zone_forwarders = [
            "azuredatabricks.net"
          ]
        },
      ]
    },
    "batch_account" = {
      subresources = [
        {
          name = "batchAccount"
          private_dns_zone_names = [
            "privatelink.batch.azure.com"
          ]
          public_dns_zone_forwarders = [
            replace("{regionName}.batch.azure.com", "{regionName}", var.region_name)
          ]
        },
        {
          name = "nodeManagement"
          private_dns_zone_names = [
            "privatelink.batch.azure.com"
          ]
          public_dns_zone_forwarders = [
            replace("{regionName}.service.batch.azure.com", "{regionName}", var.region_name)
          ]
        },
      ]
    },
    "virtual_desktop_workspace" = {
      subresources = [
        {
          name = "global"
          private_dns_zone_names = [
            "privatelink-global.wvd.microsoft.com"
          ]
          public_dns_zone_forwarders = [
            "wvd.microsoft.com"
          ]
        },
        {
          name = "feed"
          private_dns_zone_names = [
            "privatelink.wvd.microsoft.com"
          ]
          public_dns_zone_forwarders = [
            "wvd.microsoft.com"
          ]
        },
      ]
    },
    "virtual_desktop_host_pool" = {
      subresources = [
        {
          name = "connection"
          private_dns_zone_names = [
            "privatelink.wvd.microsoft.com"
          ]
          public_dns_zone_forwarders = [
            "wvd.microsoft.com"
          ]
        },
      ]
    },
    "kubernetes_cluster" = {
      subresources = [
        {
          name = "management"
          private_dns_zone_names = [
            replace("privatelink.{regionName}.azmk8s.io", "{regionName}", var.region_name),
            replace(replace("{subzone}.privatelink.{regionName}.azmk8s.io", "{regionName}", var.region_name), "{subzone}", var.subzone)
          ]
          public_dns_zone_forwarders = [
            replace("{regionName}.azmk8s.io", "{regionName}", var.region_name)
          ]
        },
      ]
    },
    "container_app" = {
      subresources = [
        {
          name = "managedEnvironment"
          private_dns_zone_names = [
            replace("privatelink.{regionName}.azurecontainerapps.io", "{regionName}", var.region_name)
          ]
          public_dns_zone_forwarders = [
            "azurecontainerapps.io"
          ]
        },
      ]
    },
    "container_registry" = {
      subresources = [
        {
          name = "privatelink.azurecr.io"
          private_dns_zone_names = [
            replace("{regionName}.data.privatelink.azurecr.io", "{regionName}", var.region_name)
          ]
          public_dns_zone_forwarders = [
            "azurecr.io",
            replace("{regionName}.data.azurecr.io", "{regionName}", var.region_name)
          ]
        },
      ]
    },
    "mssql_server" = {
      subresources = [
        {
          name = "sqlServer"
          private_dns_zone_names = [
            "privatelink.database.windows.net"
          ]
          public_dns_zone_forwarders = [
            "database.windows.net"
          ]
        },
      ]
    },
    "mssql_managed_instance" = {
      subresources = [
        {
          name = "managedInstance"
          private_dns_zone_names = [
            replace("privatelink.{dnsPrefix}.database.windows.net", "{dnsPrefix}", var.dns_prefix)
          ]
          public_dns_zone_forwarders = [
            replace(replace("{instanceName}.{dnsPrefix}.database.windows.net", "{instanceName}", var.instance_name), "{dnsPrefix}", var.dns_prefix)
          ]
        },
      ]
    },
    "cosmosdb_account" = {
      subresources = [
        {
          name = "Sql"
          private_dns_zone_names = [
            "privatelink.documents.azure.com"
          ]
          public_dns_zone_forwarders = [
            "documents.azure.com"
          ]
        },
        {
          name = "MongoDB"
          private_dns_zone_names = [
            "privatelink.mongo.cosmos.azure.com"
          ]
          public_dns_zone_forwarders = [
            "mongo.cosmos.azure.com"
          ]
        },
        {
          name = "Cassandra"
          private_dns_zone_names = [
            "privatelink.cassandra.cosmos.azure.com"
          ]
          public_dns_zone_forwarders = [
            "cassandra.cosmos.azure.com"
          ]
        },
        {
          name = "Gremlin"
          private_dns_zone_names = [
            "privatelink.gremlin.cosmos.azure.com"
          ]
          public_dns_zone_forwarders = [
            "gremlin.cosmos.azure.com"
          ]
        },
        {
          name = "Table"
          private_dns_zone_names = [
            "privatelink.table.cosmos.azure.com"
          ]
          public_dns_zone_forwarders = [
            "table.cosmos.azure.com"
          ]
        },
        {
          name = "Analytical"
          private_dns_zone_names = [
            "privatelink.analytics.cosmos.azure.com"
          ]
          public_dns_zone_forwarders = [
            "analytics.cosmos.azure.com"
          ]
        },
      ]
    },
    "postgresql_server" = {
      subresources = [
        {
          name = "postgresqlServer"
          private_dns_zone_names = [
            "privatelink.postgres.database.azure.com"
          ]
          public_dns_zone_forwarders = [
            "postgres.database.azure.com"
          ]
        },
      ]
    },
    "postgresql_flexible_server" = {
      subresources = [
        {
          name = "postgresqlServer"
          private_dns_zone_names = [
            "privatelink.postgres.database.azure.com"
          ]
          public_dns_zone_forwarders = [
            "postgres.database.azure.com"
          ]
        },
      ]
    },
    "mysql_flexible_server" = {
      subresources = [
        {
          name = "mysqlServer"
          private_dns_zone_names = [
            "privatelink.mysql.database.azure.com"
          ]
          public_dns_zone_forwarders = [
            "mysql.database.azure.com"
          ]
        },
      ]
    },
    "redis_cache" = {
      subresources = [
        {
          name = "redisCache"
          private_dns_zone_names = [
            "privatelink.redis.cache.windows.net"
          ]
          public_dns_zone_forwarders = [
            "redis.cache.windows.net"
          ]
        },
      ]
    },
    "redis_enterprise_cluster" = {
      subresources = [
        {
          name = "redisEnterprise"
          private_dns_zone_names = [
            "privatelink.redis.azure.net"
          ]
          public_dns_zone_forwarders = [
            replace("{instanceName}.{region}.redis.azure.net", "{instanceName}", var.instance_name)
          ]
        },
      ]
    },
    "arc_private_link_scope" = {
      subresources = [
        {
          name = "hybridcompute"
          private_dns_zone_names = [
            "privatelink.his.arc.azure.com",
            "privatelink.guestconfiguration.azure.com",
            "privatelink.dp.kubernetesconfiguration.azure.com"
          ]
          public_dns_zone_forwarders = [
            "his.arc.azure.com",
            "guestconfiguration.azure.com",
            "dp.kubernetesconfiguration.azure.com"
          ]
        },
      ]
    },
    "eventgrid_topic" = {
      subresources = [
        {
          name = "topic"
          private_dns_zone_names = [
            "privatelink.eventgrid.azure.net"
          ]
          public_dns_zone_forwarders = [
            "eventgrid.azure.net"
          ]
        },
      ]
    },
    "eventgrid_domain" = {
      subresources = [
        {
          name = "domain"
          private_dns_zone_names = [
            "privatelink.eventgrid.azure.net"
          ]
          public_dns_zone_forwarders = [
            "eventgrid.azure.net"
          ]
        },
      ]
    },
    "eventgrid_namespace" = {
      subresources = [
        {
          name = "topic"
          private_dns_zone_names = [
            "privatelink.eventgrid.azure.net"
          ]
          public_dns_zone_forwarders = [
            "eventgrid.azure.net"
          ]
        },
      ]
    },
    "api_management" = {
      subresources = [
        {
          name = "Gateway"
          private_dns_zone_names = [
            "privatelink.azure-api.net"
          ]
          public_dns_zone_forwarders = [
            "azure-api.net"
          ]
        },
      ]
    },
    "healthcare_workspace" = {
      subresources = [
        {
          name = "healthcareworkspace"
          private_dns_zone_names = [
            "privatelink.workspace.azurehealthcareapis.com",
            "privatelink.fhir.azurehealthcareapis.com",
            "privatelink.dicom.azurehealthcareapis.com"
          ]
          public_dns_zone_forwarders = [
            "workspace.azurehealthcareapis.com",
            "fhir.azurehealthcareapis.com",
            "dicom.azurehealthcareapis.com"
          ]
        },
      ]
    },
    "iothub" = {
      subresources = [
        {
          name = "iotHub"
          private_dns_zone_names = [
            "privatelink.azure-devices.net",
            "privatelink.servicebus.windows.net"
          ]
          public_dns_zone_forwarders = [
            "azure-devices.net",
            "servicebus.windows.net"
          ]
        },
      ]
    },
    "iothub_dps" = {
      subresources = [
        {
          name = "iotDps"
          private_dns_zone_names = [
            "privatelink.azure-devices-provisioning.net"
          ]
          public_dns_zone_forwarders = [
            "azure-devices-provisioning.net"
          ]
        },
      ]
    },
    "iothub_device_update_account" = {
      subresources = [
        {
          name = "DeviceUpdate"
          private_dns_zone_names = [
            "privatelink.api.adu.microsoft.com"
          ]
          public_dns_zone_forwarders = [
            "api.adu.microsoft.com"
          ]
        },
      ]
    },
    "iotcentral_application" = {
      subresources = [
        {
          name = "iotApp"
          private_dns_zone_names = [
            "privatelink.azureiotcentral.com"
          ]
          public_dns_zone_forwarders = [
            "azureiotcentral.com"
          ]
        },
      ]
    },
    "digital_twins_instance" = {
      subresources = [
        {
          name = "API"
          private_dns_zone_names = [
            "privatelink.digitaltwins.azure.net"
          ]
          public_dns_zone_forwarders = [
            "digitaltwins.azure.net"
          ]
        },
      ]
    },
    "automation_account" = {
      subresources = [
        {
          name = "Webhook"
          private_dns_zone_names = [
            "privatelink.azure-automation.net"
          ]
          public_dns_zone_forwarders = [
            replace("{regionCode}.azure-automation.net", "{regionCode}", local.region_code)
          ]
        },
        {
          name = "DSCAndHybridWorker"
          private_dns_zone_names = [
            "privatelink.azure-automation.net"
          ]
          public_dns_zone_forwarders = [
            replace("{regionCode}.azure-automation.net", "{regionCode}", local.region_code)
          ]
        },
      ]
    },
    "recovery_services_vault" = {
      subresources = [
        {
          name = "AzureBackup"
          private_dns_zone_names = [
            replace("privatelink.{regionCode}.backup.windowsazure.com", "{regionCode}", local.region_code)
          ]
          public_dns_zone_forwarders = [
            replace("{regionCode}.backup.windowsazure.com", "{regionCode}", local.region_code)
          ]
        },
        {
          name = "AzureSiteRecovery"
          private_dns_zone_names = [
            "privatelink.siterecovery.windowsazure.com"
          ]
          public_dns_zone_forwarders = [
            replace("{regionCode}.siterecovery.windowsazure.com", "{regionCode}", local.region_code)
          ]
        },
      ]
    },
    "monitor_private_link_scope" = {
      subresources = [
        {
          name = "azuremonitor"
          private_dns_zone_names = [
            "privatelink.monitor.azure.com",
            "privatelink.oms.opinsights.azure.com",
            "privatelink.ods.opinsights.azure.com",
            "privatelink.agentsvc.azure-automation.net",
            "privatelink.blob.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "monitor.azure.com",
            "oms.opinsights.azure.com",
            "ods.opinsights.azure.com",
            "agentsvc.azure-automation.net",
            "blob.core.windows.net",
            "services.visualstudio.com",
            "applicationinsights.azure.com"
          ]
        },
      ]
    },
    "purview_account" = {
      subresources = [
        {
          name = "account"
          private_dns_zone_names = [
            "privatelink.purview.azure.com"
          ]
          public_dns_zone_forwarders = [
            "purview.azure.com"
          ]
        },
        {
          name = "portal"
          private_dns_zone_names = [
            "privatelink.purviewstudio.azure.com"
          ]
          public_dns_zone_forwarders = [
            "purviewstudio.azure.com"
          ]
        },
        {
          name = "platform"
          private_dns_zone_names = [
            "privatelink.purview-service.microsoft.com"
          ]
          public_dns_zone_forwarders = [
            "purview-service.microsoft.com"
          ]
        },
      ]
    },
    "resource_management_private_link" = {
      subresources = [
        {
          name = "ResourceManagement"
          private_dns_zone_names = [
            "privatelink.azure.com"
          ]
          public_dns_zone_forwarders = [
            "azure.com"
          ]
        },
      ]
    },
    "dashboard_grafana" = {
      subresources = [
        {
          name = "grafana"
          private_dns_zone_names = [
            "privatelink.grafana.azure.com"
          ]
          public_dns_zone_forwarders = [
            "grafana.azure.com"
          ]
        },
      ]
    },
    "key_vault" = {
      subresources = [
        {
          name = "vault"
          private_dns_zone_names = [
            "privatelink.vaultcore.azure.net"
          ]
          public_dns_zone_forwarders = [
            "vault.azure.net",
            "vaultcore.azure.net"
          ]
        },
        {
          name = "managedhsm"
          private_dns_zone_names = [
            "privatelink.managedhsm.azure.net"
          ]
          public_dns_zone_forwarders = [
            "managedhsm.azure.net"
          ]
        },
      ]
    },
    "app_configuration" = {
      subresources = [
        {
          name = "configurationStores"
          private_dns_zone_names = [
            "privatelink.azconfig.io"
          ]
          public_dns_zone_forwarders = [
            "azconfig.io"
          ]
        },
      ]
    },
    "attestation_provider" = {
      subresources = [
        {
          name = "standard"
          private_dns_zone_names = [
            "privatelink.attest.azure.net"
          ]
          public_dns_zone_forwarders = [
            "attest.azure.net"
          ]
        },
      ]
    },
    "storage_account" = {
      subresources = [
        {
          name = "blob"
          private_dns_zone_names = [
            "privatelink.blob.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "blob.core.windows.net"
          ]
        },
        {
          name = "blob_secondary"
          private_dns_zone_names = [
            "privatelink.blob.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "blob.core.windows.net"
          ]
        },
        {
          name = "table"
          private_dns_zone_names = [
            "privatelink.table.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "table.core.windows.net"
          ]
        },
        {
          name = "table_secondary"
          private_dns_zone_names = [
            "privatelink.table.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "table.core.windows.net"
          ]
        },
        {
          name = "queue"
          private_dns_zone_names = [
            "privatelink.queue.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "queue.core.windows.net"
          ]
        },
        {
          name = "queue_secondary"
          private_dns_zone_names = [
            "privatelink.queue.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "queue.core.windows.net"
          ]
        },
        {
          name = "file"
          private_dns_zone_names = [
            "privatelink.file.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "file.core.windows.net"
          ]
        },
        {
          name = "web"
          private_dns_zone_names = [
            "privatelink.web.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "web.core.windows.net"
          ]
        },
        {
          name = "web_secondary"
          private_dns_zone_names = [
            "privatelink.web.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "web.core.windows.net"
          ]
        },
        {
          name = "dfs"
          private_dns_zone_names = [
            "privatelink.dfs.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "dfs.core.windows.net"
          ]
        },
        {
          name = "dfs_secondary"
          private_dns_zone_names = [
            "privatelink.dfs.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "dfs.core.windows.net"
          ]
        },
      ]
    },
    "storage_sync" = {
      subresources = [
        {
          name = "afs"
          private_dns_zone_names = [
            "privatelink.afs.azure.net"
          ]
          public_dns_zone_forwarders = [
            "afs.azure.net"
          ]
        },
      ]
    },
    "managed_disk" = {
      subresources = [
        {
          name = "disks"
          private_dns_zone_names = [
            "privatelink.blob.core.windows.net"
          ]
          public_dns_zone_forwarders = [
            "blob.core.windows.net"
          ]
        },
      ]
    },
    "search_service" = {
      subresources = [
        {
          name = "searchService"
          private_dns_zone_names = [
            "privatelink.search.windows.net"
          ]
          public_dns_zone_forwarders = [
            "search.windows.net"
          ]
        },
      ]
    },
    "relay_namespace" = {
      subresources = [
        {
          name = "namespace"
          private_dns_zone_names = [
            "privatelink.servicebus.windows.net"
          ]
          public_dns_zone_forwarders = [
            "servicebus.windows.net"
          ]
        },
      ]
    },
    "linux_function_app" = {
      subresources = [
        {
          name = "sites"
          private_dns_zone_names = [
            "privatelink.azurewebsites.net",
            "scm.privatelink.azurewebsites.net"
          ]
          public_dns_zone_forwarders = [
            "azurewebsites.net",
            "scm.azurewebsites.net"
          ]
        },
      ]
    },
    "windows_function_app" = {
      subresources = [
        {
          name = "sites"
          private_dns_zone_names = [
            "privatelink.azurewebsites.net",
            "scm.privatelink.azurewebsites.net"
          ]
          public_dns_zone_forwarders = [
            "azurewebsites.net",
            "scm.azurewebsites.net"
          ]
        },
      ]
    },
    "signalr_service" = {
      subresources = [
        {
          name = "signalr"
          private_dns_zone_names = [
            "privatelink.service.signalr.net"
          ]
          public_dns_zone_forwarders = [
            "service.signalr.net"
          ]
        },
      ]
    },
    "static_web_app" = {
      subresources = [
        {
          name = "staticSites"
          private_dns_zone_names = [
            "privatelink.azurestaticapps.net",
            replace("privatelink.{partitionId}.azurestaticapps.net", "{partitionId}", var.partition_id)
          ]
          public_dns_zone_forwarders = [
            "azurestaticapps.net",
            replace("{partitionId}.azurestaticapps.net", "{partitionId}", var.partition_id)
          ]
        },
      ]
    },
    "web_pubsub" = {
      subresources = [
        {
          name = "webpubsub"
          private_dns_zone_names = [
            "privatelink.webpubsub.azure.com"
          ]
          public_dns_zone_forwarders = [
            "webpubsub.azure.com"
          ]
        },
      ]
    }
  }
  region_code_map = {
    eastus             = "EUS"
    southcentralus     = "SCUS"
    westus2            = "WUS2"
    westus3            = "WUS3"
    australiaeast      = "AE"
    southeastasia      = "SEA"
    northeurope        = "NE"
    swedencentral      = "SDC"
    uksouth            = "UKS"
    westeurope         = "WE"
    centralus          = "CUS"
    southafricanorth   = "SAN"
    centralindia       = "INC"
    eastasia           = "EA"
    japaneast          = "JPE"
    koreacentral       = "KRC"
    newzealandnorth    = "NZN"
    canadacentral      = "CNC"
    francecentral      = "FRC"
    germanywestcentral = "GWC"
    italynorth         = "ITN"
    norwayeast         = "NWE"
    polandcentral      = "PLC"
    spaincentral       = "SPC"
    switzerlandnorth   = "SZN"
    mexicocentral      = "MXC"
    uaenorth           = "UAN"
    brazilsouth        = "BRS"
    israelcentral      = "ILC"
    qatarcentral       = "QAC"
    eastus2            = "EUS2"
    northcentralus     = "NCUS"
    westus             = "WUS"
    japanwest          = "JPW"
    jioindiawest       = "JIW"
    centraluseuap      = "CCY"
    eastus2euap        = "ECY"
    westcentralus      = "WCUS"
    southafricawest    = "SAW"
    australiacentral   = "ACL"
    australiacentral2  = "ACL2"
    australiasoutheast = "ASE"
    jioindiacentral    = "JIC"
    koreasouth         = "KRS"
    southindia         = "INS"
    westindia          = "INW"
    canadaeast         = "CNE"
    francesouth        = "FRS"
    germanynorth       = "GN"
    norwaywest         = "NWW"
    switzerlandwest    = "SZW"
    ukwest             = "UKW"
    uaecentral         = "UAC"
    brazilsoutheast    = "BSE"
  }
}
