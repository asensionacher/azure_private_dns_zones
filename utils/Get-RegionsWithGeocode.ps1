$goodregions = @()
$regions = az account list-locations | ConvertFrom-Json
$geocodes = (cat geocode.json | ConvertFrom-Json).GeoCodeList.GeoCodeRegionNameMap
foreach ($region in $regions) {
    $geocode = ($geocodes | where { $_._RegionName -like $region.DisplayName })._GeoCode
    $geocode
    if ($geocode -ne $null) {
        if ($geocode.gettype().Name -notlike "String") {
            $geocode = $geocode[0]
        }
        $region | Add-Member -MemberType NoteProperty -Name "GeoCode" -Value $geocode
        $goodregions += $region
    }
}

$goodregions | ConvertTo-Json -Depth 10 | Out-File regions.json