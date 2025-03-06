variable "region_name" {
  type        = string
  description = <<DESCRIPTION
    Refers to the full region name (for example, eastus for East US and 
    northeurope for North Europe).

    If no value is setted, the default value `{regionName}` will be setted, 
    so remember to assign the correct value when retreiving the outputs.

    The `{regionCode}` will be neither informed, so remember to
    assign the correct value when retreiving the outputs.
  DESCRIPTION
  default     = "{regionName}"
  validation {
    condition = contains([
      "eastus", "southcentralus", "westus2", "westus3", "australiaeast", "southeastasia",
      "northeurope", "swedencentral", "uksouth", "westeurope", "centralus", "southafricanorth",
      "centralindia", "eastasia", "japaneast", "koreacentral", "newzealandnorth", "canadacentral",
      "francecentral", "germanywestcentral", "italynorth", "norwayeast", "polandcentral",
      "spaincentral", "switzerlandnorth", "mexicocentral", "uaenorth", "brazilsouth",
      "israelcentral", "qatarcentral", "eastus2", "northcentralus", "westus", "japanwest",
      "jioindiawest", "centraluseuap", "eastus2euap", "westcentralus", "southafricawest",
      "australiacentral", "australiacentral2", "australiasoutheast", "jioindiacentral",
      "koreasouth", "southindia", "westindia", "canadaeast", "francesouth", "germanynorth",
      "norwaywest", "switzerlandwest", "ukwest", "uaecentral", "brazilsoutheast", "{regionName}"
    ], var.region_name)
    error_message = "Invalid region. Choose a valid Azure region from the allowed list."
  }
}

variable "instance_name" {
  type        = string
  description = <<DESCRIPTION
        Refers to the instance name of the resource you are deploying. If not informed, 
        the default value `{instanceName}` will be setted, 
        so remember to assign the correct value when retreiving the outputs.
    DESCRIPTION
  default     = "{instanceName}"
}

variable "dns_prefix" {
  type        = string
  description = <<DESCRIPTION
        Refers to the DNS Previx name of the resource you are deploying. If not informed, 
        the default value `{dnsPrefix}` will be setted, 
        so remember to assign the correct value when retreiving the outputs.
    DESCRIPTION
  default     = "{dnsPrefix}"
}

variable "subzone" {
  type        = string
  description = <<DESCRIPTION
        Refers to the Subzone name of the resource you are deploying. If not informed, 
        the default value `{subzone}` will be setted, 
        so remember to assign the correct value when retreiving the outputs.
    DESCRIPTION
  default     = "{subzone}"
}

variable "partition_id" {
  type        = string
  description = <<DESCRIPTION
        Refers to the partition id of the resource you are deploying. If not informed, 
        the default value `{partitionId}` will be setted, 
        so remember to assign the correct value when retreiving the outputs.
    DESCRIPTION
  default     = "{partitionId}"
}

