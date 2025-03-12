locals {
  az = {
    "machine_learning_workspace" = {
      "amlworkspace" = {
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

    },
    "ai_services" = {
      "account" = {
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

    },
    "bot_service_azure_bot" = {
      "Bot" = {
        name = "Bot"
        private_dns_zone_names = [
          "privatelink.directline.botframework.com"
        ]
        public_dns_zone_forwarders = [
          "directline.botframework.com"
        ]
      },
      "Token" = {
        name = "Token"
        private_dns_zone_names = [
          "privatelink.token.botframework.com"
        ]
        public_dns_zone_forwarders = [
          "token.botframework.com"
        ]
      },

    },
    "synapse_workspace" = {
      "Sql" = {
        name = "Sql"
        private_dns_zone_names = [
          "privatelink.sql.azuresynapse.net"
        ]
        public_dns_zone_forwarders = [
          "sql.azuresynapse.net"
        ]
      },
      "SqlOnDemand" = {
        name = "SqlOnDemand"
        private_dns_zone_names = [
          "privatelink.sql.azuresynapse.net"
        ]
        public_dns_zone_forwarders = [
          "sql.azuresynapse.net"
        ]
      },
      "Dev" = {
        name = "Dev"
        private_dns_zone_names = [
          "privatelink.dev.azuresynapse.net"
        ]
        public_dns_zone_forwarders = [
          "dev.azuresynapse.net"
        ]
      },

    },
    "synapse_private_link_hub" = {
      "Web" = {
        name = "Web"
        private_dns_zone_names = [
          "privatelink.azuresynapse.net"
        ]
        public_dns_zone_forwarders = [
          "azuresynapse.net"
        ]
      },

    },
    "eventhub" = {
      "namespace" = {
        name = "namespace"
        private_dns_zone_names = [
          "privatelink.servicebus.windows.net"
        ]
        public_dns_zone_forwarders = [
          "servicebus.windows.net"
        ]
      },

    },
    "servicebus_namespace" = {
      "namespace" = {
        name = "namespace"
        private_dns_zone_names = [
          "privatelink.servicebus.windows.net"
        ]
        public_dns_zone_forwarders = [
          "servicebus.windows.net"
        ]
      },

    },
    "data_factory" = {
      "dataFactory" = {
        name = "dataFactory"
        private_dns_zone_names = [
          "privatelink.datafactory.azure.net"
        ]
        public_dns_zone_forwarders = [
          "datafactory.azure.net"
        ]
      },
      "portal" = {
        name = "portal"
        private_dns_zone_names = [
          "privatelink.adf.azure.com"
        ]
        public_dns_zone_forwarders = [
          "adf.azure.com"
        ]
      },

    },
    "hdinsight_hadoop_cluster" = {
      "gateway" = {
        name = "gateway"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },
      "headnode" = {
        name = "headnode"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },

    },
    "hdinsight_hbase_cluster" = {
      "gateway" = {
        name = "gateway"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },
      "headnode" = {
        name = "headnode"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },

    },
    "hdinsight_kafka_cluster" = {
      "gateway" = {
        name = "gateway"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },
      "headnode" = {
        name = "headnode"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },

    },
    "hdinsight_spark_cluster" = {
      "gateway" = {
        name = "gateway"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },
      "headnode" = {
        name = "headnode"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },

    },
    "hdinsight_interactive_query_cluster" = {
      "gateway" = {
        name = "gateway"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },
      "headnode" = {
        name = "headnode"
        private_dns_zone_names = [
          "privatelink.azurehdinsight.net"
        ]
        public_dns_zone_forwarders = [
          "azurehdinsight.net"
        ]
      },

    },
    "kusto_cluster" = {
      "cluster" = {
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

    },
    "databricks_workspace" = {
      "databricks_ui_api" = {
        name = "databricks_ui_api"
        private_dns_zone_names = [
          "privatelink.azuredatabricks.net"
        ]
        public_dns_zone_forwarders = [
          "azuredatabricks.net"
        ]
      },
      "browser_authentication" = {
        name = "browser_authentication"
        private_dns_zone_names = [
          "privatelink.azuredatabricks.net"
        ]
        public_dns_zone_forwarders = [
          "azuredatabricks.net"
        ]
      },

    },
    "batch_account" = {
      "batchAccount" = {
        name = "batchAccount"
        private_dns_zone_names = [
          "privatelink.batch.azure.com"
        ]
        public_dns_zone_forwarders = [
          replace("{regionName}.batch.azure.com", "{regionName}", var.region_name)
        ]
      },
      "nodeManagement" = {
        name = "nodeManagement"
        private_dns_zone_names = [
          "privatelink.batch.azure.com"
        ]
        public_dns_zone_forwarders = [
          replace("{regionName}.service.batch.azure.com", "{regionName}", var.region_name)
        ]
      },

    },
    "virtual_desktop_workspace" = {
      "global" = {
        name = "global"
        private_dns_zone_names = [
          "privatelink-global.wvd.microsoft.com"
        ]
        public_dns_zone_forwarders = [
          "wvd.microsoft.com"
        ]
      },
      "feed" = {
        name = "feed"
        private_dns_zone_names = [
          "privatelink.wvd.microsoft.com"
        ]
        public_dns_zone_forwarders = [
          "wvd.microsoft.com"
        ]
      },

    },
    "virtual_desktop_host_pool" = {
      "connection" = {
        name = "connection"
        private_dns_zone_names = [
          "privatelink.wvd.microsoft.com"
        ]
        public_dns_zone_forwarders = [
          "wvd.microsoft.com"
        ]
      },

    },
    "kubernetes_cluster" = {
      "management" = {
        name = "management"
        private_dns_zone_names = [
          replace("privatelink.{regionName}.azmk8s.io", "{regionName}", var.region_name),
          replace(replace("{subzone}.privatelink.{regionName}.azmk8s.io", "{regionName}", var.region_name), "{subzone}", var.subzone)
        ]
        public_dns_zone_forwarders = [
          replace("{regionName}.azmk8s.io", "{regionName}", var.region_name)
        ]
      },

    },
    "container_app" = {
      "managedEnvironment" = {
        name = "managedEnvironment"
        private_dns_zone_names = [
          replace("privatelink.{regionName}.azurecontainerapps.io", "{regionName}", var.region_name)
        ]
        public_dns_zone_forwarders = [
          "azurecontainerapps.io"
        ]
      },

    },
    "container_registry" = {
      "privatelink.azurecr.io" = {
        name = "privatelink.azurecr.io"
        private_dns_zone_names = [
          replace("{regionName}.data.privatelink.azurecr.io", "{regionName}", var.region_name)
        ]
        public_dns_zone_forwarders = [
          "azurecr.io",
          replace("{regionName}.data.azurecr.io", "{regionName}", var.region_name)
        ]
      },

    },
    "mssql_server" = {
      "sqlServer" = {
        name = "sqlServer"
        private_dns_zone_names = [
          "privatelink.database.windows.net"
        ]
        public_dns_zone_forwarders = [
          "database.windows.net"
        ]
      },

    },
    "mssql_managed_instance" = {
      "privatelink.{dnsPrefix}.database.windows.net" = {
        name = "privatelink.{dnsPrefix}.database.windows.net"
        private_dns_zone_names = [
        ]
        public_dns_zone_forwarders = [
          replace(replace("{instanceName}.{dnsPrefix}.database.windows.net", "{instanceName}", var.instance_name), "{dnsPrefix}", var.dns_prefix)
        ]
      },

    },
    "cosmosdb_account" = {
      "Sql" = {
        name = "Sql"
        private_dns_zone_names = [
          "privatelink.documents.azure.com"
        ]
        public_dns_zone_forwarders = [
          "documents.azure.com"
        ]
      },
      "MongoDB" = {
        name = "MongoDB"
        private_dns_zone_names = [
          "privatelink.mongo.cosmos.azure.com"
        ]
        public_dns_zone_forwarders = [
          "mongo.cosmos.azure.com"
        ]
      },
      "Cassandra" = {
        name = "Cassandra"
        private_dns_zone_names = [
          "privatelink.cassandra.cosmos.azure.com"
        ]
        public_dns_zone_forwarders = [
          "cassandra.cosmos.azure.com"
        ]
      },
      "Gremlin" = {
        name = "Gremlin"
        private_dns_zone_names = [
          "privatelink.gremlin.cosmos.azure.com"
        ]
        public_dns_zone_forwarders = [
          "gremlin.cosmos.azure.com"
        ]
      },
      "Table" = {
        name = "Table"
        private_dns_zone_names = [
          "privatelink.table.cosmos.azure.com"
        ]
        public_dns_zone_forwarders = [
          "table.cosmos.azure.com"
        ]
      },
      "Analytical" = {
        name = "Analytical"
        private_dns_zone_names = [
          "privatelink.analytics.cosmos.azure.com"
        ]
        public_dns_zone_forwarders = [
          "analytics.cosmos.azure.com"
        ]
      },

    },
    "postgresql_server" = {
      "postgresqlServer" = {
        name = "postgresqlServer"
        private_dns_zone_names = [
          "privatelink.postgres.database.azure.com"
        ]
        public_dns_zone_forwarders = [
          "postgres.database.azure.com"
        ]
      },

    },
    "postgresql_flexible_server" = {
      "postgresqlServer" = {
        name = "postgresqlServer"
        private_dns_zone_names = [
          "privatelink.postgres.database.azure.com"
        ]
        public_dns_zone_forwarders = [
          "postgres.database.azure.com"
        ]
      },

    },
    "mysql_flexible_server" = {
      "mysqlServer" = {
        name = "mysqlServer"
        private_dns_zone_names = [
          "privatelink.mysql.database.azure.com"
        ]
        public_dns_zone_forwarders = [
          "mysql.database.azure.com"
        ]
      },

    },
    "redis_cache" = {
      "redisCache" = {
        name = "redisCache"
        private_dns_zone_names = [
          "privatelink.redis.cache.windows.net"
        ]
        public_dns_zone_forwarders = [
          "redis.cache.windows.net"
        ]
      },

    },
    "redis_enterprise_cluster" = {
      "redisEnterprise" = {
        name = "redisEnterprise"
        private_dns_zone_names = [
          "privatelink.redis.azure.net"
        ]
        public_dns_zone_forwarders = [
          replace("{instanceName}.{region}.redis.azure.net", "{instanceName}", var.instance_name)
        ]
      },

    },
    "arc_private_link_scope" = {
      "hybridcompute" = {
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

    },
    "eventgrid_topic" = {
      "topic" = {
        name = "topic"
        private_dns_zone_names = [
          "privatelink.eventgrid.azure.net"
        ]
        public_dns_zone_forwarders = [
          "eventgrid.azure.net"
        ]
      },

    },
    "eventgrid_domain" = {
      "domain" = {
        name = "domain"
        private_dns_zone_names = [
          "privatelink.eventgrid.azure.net"
        ]
        public_dns_zone_forwarders = [
          "eventgrid.azure.net"
        ]
      },

    },
    "eventgrid_namespace" = {
      "topic" = {
        name = "topic"
        private_dns_zone_names = [
          "privatelink.eventgrid.azure.net"
        ]
        public_dns_zone_forwarders = [
          "eventgrid.azure.net"
        ]
      },

    },
    "api_management" = {
      "Gateway" = {
        name = "Gateway"
        private_dns_zone_names = [
          "privatelink.azure-api.net"
        ]
        public_dns_zone_forwarders = [
          "azure-api.net"
        ]
      },

    },
    "healthcare_workspace" = {
      "healthcareworkspace" = {
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

    },
    "iothub" = {
      "iotHub" = {
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

    },
    "iothub_dps" = {
      "iotDps" = {
        name = "iotDps"
        private_dns_zone_names = [
          "privatelink.azure-devices-provisioning.net"
        ]
        public_dns_zone_forwarders = [
          "azure-devices-provisioning.net"
        ]
      },

    },
    "iothub_device_update_account" = {
      "DeviceUpdate" = {
        name = "DeviceUpdate"
        private_dns_zone_names = [
          "privatelink.api.adu.microsoft.com"
        ]
        public_dns_zone_forwarders = [
          "api.adu.microsoft.com"
        ]
      },

    },
    "iotcentral_application" = {
      "iotApp" = {
        name = "iotApp"
        private_dns_zone_names = [
          "privatelink.azureiotcentral.com"
        ]
        public_dns_zone_forwarders = [
          "azureiotcentral.com"
        ]
      },

    },
    "digital_twins_instance" = {
      "API" = {
        name = "API"
        private_dns_zone_names = [
          "privatelink.digitaltwins.azure.net"
        ]
        public_dns_zone_forwarders = [
          "digitaltwins.azure.net"
        ]
      },

    },
    "automation_account" = {
      "Webhook" = {
        name = "Webhook"
        private_dns_zone_names = [
          replace("privatelink.azure-automation.net", "{regionCode}", local.region_code)
        ]
        public_dns_zone_forwarders = [
          replace("{regionCode}.azure-automation.net", "{regionCode}", local.region_code)
        ]
      },
      "DSCAndHybridWorker" = {
        name = "DSCAndHybridWorker"
        private_dns_zone_names = [
          replace("privatelink.azure-automation.net", "{regionCode}", local.region_code)
        ]
        public_dns_zone_forwarders = [
          replace("{regionCode}.azure-automation.net", "{regionCode}", local.region_code)
        ]
      },

    },
    "recovery_services_vault" = {
      "AzureBackup" = {
        name = "AzureBackup"
        private_dns_zone_names = [
          replace("privatelink.{regionCode}.backup.windowsazure.com", "{regionCode}", local.region_code)
        ]
        public_dns_zone_forwarders = [
          replace("{regionCode}.backup.windowsazure.com", "{regionCode}", local.region_code)
        ]
      },
      "AzureSiteRecovery" = {
        name = "AzureSiteRecovery"
        private_dns_zone_names = [
          replace("privatelink.siterecovery.windowsazure.com", "{regionCode}", local.region_code)
        ]
        public_dns_zone_forwarders = [
          replace("{regionCode}.siterecovery.windowsazure.com", "{regionCode}", local.region_code)
        ]
      },

    },
    "monitor_private_link_scope" = {
      "azuremonitor" = {
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

    },
    "purview_account" = {
      "account" = {
        name = "account"
        private_dns_zone_names = [
          "privatelink.purview.azure.com"
        ]
        public_dns_zone_forwarders = [
          "purview.azure.com"
        ]
      },
      "portal" = {
        name = "portal"
        private_dns_zone_names = [
          "privatelink.purviewstudio.azure.com"
        ]
        public_dns_zone_forwarders = [
          "purviewstudio.azure.com"
        ]
      },
      "platform" = {
        name = "platform"
        private_dns_zone_names = [
          "privatelink.purview-service.microsoft.com"
        ]
        public_dns_zone_forwarders = [
          "purview-service.microsoft.com"
        ]
      },

    },
    "resource_management_private_link" = {
      "ResourceManagement" = {
        name = "ResourceManagement"
        private_dns_zone_names = [
          "privatelink.azure.com"
        ]
        public_dns_zone_forwarders = [
          "azure.com"
        ]
      },

    },
    "dashboard_grafana" = {
      "grafana" = {
        name = "grafana"
        private_dns_zone_names = [
          "privatelink.grafana.azure.com"
        ]
        public_dns_zone_forwarders = [
          "grafana.azure.com"
        ]
      },

    },
    "key_vault" = {
      "vault" = {
        name = "vault"
        private_dns_zone_names = [
          "privatelink.vaultcore.azure.net"
        ]
        public_dns_zone_forwarders = [
          "vault.azure.net",
          "vaultcore.azure.net"
        ]
      },
      "managedhsm" = {
        name = "managedhsm"
        private_dns_zone_names = [
          "privatelink.managedhsm.azure.net"
        ]
        public_dns_zone_forwarders = [
          "managedhsm.azure.net"
        ]
      },

    },
    "app_configuration" = {
      "configurationStores" = {
        name = "configurationStores"
        private_dns_zone_names = [
          "privatelink.azconfig.io"
        ]
        public_dns_zone_forwarders = [
          "azconfig.io"
        ]
      },

    },
    "attestation_provider" = {
      "standard" = {
        name = "standard"
        private_dns_zone_names = [
          "privatelink.attest.azure.net"
        ]
        public_dns_zone_forwarders = [
          "attest.azure.net"
        ]
      },

    },
    "storage_account" = {
      "blob" = {
        name = "blob"
        private_dns_zone_names = [
          "privatelink.blob.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "blob.core.windows.net"
        ]
      },
      "blob_secondary" = {
        name = "blob_secondary"
        private_dns_zone_names = [
          "privatelink.blob.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "blob.core.windows.net"
        ]
      },
      "table" = {
        name = "table"
        private_dns_zone_names = [
          "privatelink.table.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "table.core.windows.net"
        ]
      },
      "table_secondary" = {
        name = "table_secondary"
        private_dns_zone_names = [
          "privatelink.table.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "table.core.windows.net"
        ]
      },
      "queue" = {
        name = "queue"
        private_dns_zone_names = [
          "privatelink.queue.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "queue.core.windows.net"
        ]
      },
      "queue_secondary" = {
        name = "queue_secondary"
        private_dns_zone_names = [
          "privatelink.queue.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "queue.core.windows.net"
        ]
      },
      "file" = {
        name = "file"
        private_dns_zone_names = [
          "privatelink.file.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "file.core.windows.net"
        ]
      },
      "web" = {
        name = "web"
        private_dns_zone_names = [
          "privatelink.web.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "web.core.windows.net"
        ]
      },
      "web_secondary" = {
        name = "web_secondary"
        private_dns_zone_names = [
          "privatelink.web.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "web.core.windows.net"
        ]
      },
      "dfs" = {
        name = "dfs"
        private_dns_zone_names = [
          "privatelink.dfs.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "dfs.core.windows.net"
        ]
      },
      "dfs_secondary" = {
        name = "dfs_secondary"
        private_dns_zone_names = [
          "privatelink.dfs.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "dfs.core.windows.net"
        ]
      },

    },
    "storage_sync" = {
      "afs" = {
        name = "afs"
        private_dns_zone_names = [
          "privatelink.afs.azure.net"
        ]
        public_dns_zone_forwarders = [
          "afs.azure.net"
        ]
      },

    },
    "managed_disk" = {
      "disks" = {
        name = "disks"
        private_dns_zone_names = [
          "privatelink.blob.core.windows.net"
        ]
        public_dns_zone_forwarders = [
          "blob.core.windows.net"
        ]
      },

    },
    "search_service" = {
      "searchService" = {
        name = "searchService"
        private_dns_zone_names = [
          "privatelink.search.windows.net"
        ]
        public_dns_zone_forwarders = [
          "search.windows.net"
        ]
      },

    },
    "relay_namespace" = {
      "namespace" = {
        name = "namespace"
        private_dns_zone_names = [
          "privatelink.servicebus.windows.net"
        ]
        public_dns_zone_forwarders = [
          "servicebus.windows.net"
        ]
      },

    },
    "linux_function_app" = {
      "sites" = {
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

    },
    "windows_function_app" = {
      "sites" = {
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

    },
    "signalr_service" = {
      "signalr" = {
        name = "signalr"
        private_dns_zone_names = [
          "privatelink.service.signalr.net"
        ]
        public_dns_zone_forwarders = [
          "service.signalr.net"
        ]
      },

    },
    "static_web_app" = {
      "staticSites" = {
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

    },
    "web_pubsub" = {
      "webpubsub" = {
        name = "webpubsub"
        private_dns_zone_names = [
          "privatelink.webpubsub.azure.com"
        ]
        public_dns_zone_forwarders = [
          "webpubsub.azure.com"
        ]
      },

    }
  }
}
