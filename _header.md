# Azure Private DNS Zones helper

This module helps you to easily deploy Private DNS zones for Azure private endpoints for Terraform without havingsub to remember or going into the documentation to check the zone names. The goal of this module is that for each resource you need to deploy the Private DNS zones you will be easily able to get this name for being used to deploy the resource and be sure you are not having any error on the name or the subresource.

## Usage

For every resource in `terraform_azurerm`just remove the `azurerm` part of the module and use the different properties of this output. Following [Azure Private Endpoint private DNS zone values Microsoft documentation](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-dns), some private DNS zones needs a `dns_prefix`, `instance_name`, `partition_id`, `region_name` or `subzone` so add it into the variables if needed. If those values are not setted, the default value will be applied like in the Microsoft documentation appears (see [Inputs](#Inputs) for more information).

Check for the [examples folder](./examles) for full examples on how to retrieve the values of the module. With this values then you can create your own `Private Endpoints` or `Private DNS Zones` without errors.

