$string = ""

$objects = cat objects.json | ConvertFrom-Json

foreach ($object in $objects) {
    $string += "output `"$($object.name)`" {`n"
    $string += "value = local.az.$($object.name)`n"
    $description = ""
    foreach ($word in $object.name.split('_')) {
        $description += $word.Substring(0, 1).ToUpper() + $word.Substring(1) + " "
    }
    $string += "description = `"$($description.Trim())`"`n"
    $string += "}`n`n"
}
$string | Out-File outputs.tf

$string = "locals {`n"
$string += "az = {"

for ($j = 0; $j -lt $objects.count; $j++) {
    $object = $objects[$j]
    $string += "`n`"$($object.name)`" = {`n"
    for ($k = 0; $k -lt $object.subresources.count; $k++) {
        $subresource = $object.subresources[$k]
        $string += "`"$($subresource.name)`" = {`n"
        $string += "name = `"$($subresource.name)`"`n"
        $string += "private_dns_zone_names = ["
        for ($i = 0; $i -lt $subresource.PrivateDnsZoneNames.count; $i++) {
            $text = "`"$($subresource.PrivateDnsZoneNames[$i])`""
            if ($subresource.PrivateDnsZoneNames[$i] -like "*{regionName}*") {
                $text = "replace($($text), `"{regionName}`", var.region_name)"
            }
            if ($subresource.PublicDnsZoneForwarders[$i] -like "*{regionCode}*") {
                $text = "replace($($text), `"{regionCode}`", local.region_code)"
            }
            if ($subresource.PrivateDnsZoneNames[$i] -like "*{instanceName}*") {
                $text = "replace($($text), `"{instanceName}`", var.instance_name)"
            }
            if ($subresource.PrivateDnsZoneNames[$i] -like "*{dnsPrefix}*") {
                $text = "replace($($text), `"{dnsPrefix}`", var.dns_prefix)"
            }
            if ($subresource.PrivateDnsZoneNames[$i] -like "*{subzone}*") {
                $text = "replace($($text), `"{subzone}`", var.subzone)"
            }
            if ($subresource.PrivateDnsZoneNames[$i] -like "*{partitionId}*") {
                $text = "replace($($text), `"{partitionId}`", var.partition_id)"
            }
            $string += "`n$($text)"
            if ($i -ne ($subresource.PrivateDnsZoneNames.count - 1)) {
                $string += ","
            }
        }
        $string += "`n]`n"
        $string += "public_dns_zone_forwarders = ["
        for ($i = 0; $i -lt $subresource.PublicDnsZoneForwarders.count; $i++) {
            $text = "`"$($subresource.PublicDnsZoneForwarders[$i])`""
            if ($subresource.PublicDnsZoneForwarders[$i] -like "*{regionName}*") {
                $text = "replace($($text), `"{regionName}`", var.region_name)"
            }
            if ($subresource.PublicDnsZoneForwarders[$i] -like "*{regionCode}*") {
                $text = "replace($($text), `"{regionCode}`", local.region_code)"
            }
            if ($subresource.PublicDnsZoneForwarders[$i] -like "*{instanceName}*") {
                $text = "replace($($text), `"{instanceName}`", var.instance_name)"
            }
            if ($subresource.PublicDnsZoneForwarders[$i] -like "*{dnsPrefix}*") {
                $text = "replace($($text), `"{dnsPrefix}`", var.dns_prefix)"
            }
            if ($subresource.PublicDnsZoneForwarders[$i] -like "*{subzone}*") {
                $text = "replace($($text), `"{subzone}`", var.subzone)"
            }
            if ($subresource.PublicDnsZoneForwarders[$i] -like "*{partitionId}*") {
                $text = "replace($($text), `"{partitionId}`", var.partition_id)"
            }
            $string += "`n$($text)"
            if ($i -ne ($subresource.PublicDnsZoneForwarders.count - 1)) {
                $string += ","
            }
        }
        $string += "`n]`n}"
        if ($k -ne ($objects.subresources.count - 1)) {
            $string += ",`n"
        }
    }
    $string += "`n}"
    if ($j -ne ($objects.count - 1)) {
        $string += ","
    }
}
$string += "`n}`n}"



$string | out-file private_dns_zones.locals.tf

$regions = cat regions.json | ConvertFrom-Json

$string = "locals {`n"
$string += "region_code_map = {"
foreach ($region in $regions) {
    $string += "`n$($region.name) = `"$($region.GeoCode.ToLower())`""
}
$string += "`n}`n"
$string += "region_code = lookup(local.region_code_map, var.region_name, `"{regionCode}`")"
$string += "`n}"
$string | out-file region_code_map.locals.tf

terraform fmt