# Classic
Add-AzureAccount

$ImageList = Get-AzureVMImage;
foreach ($image in $ImageList) {
  if($image.ImageName -like "*CentOS-74*"){
  $Output = New-Object PSObject
  $Output | Add-Member Name $image.ImageName
  $Output | Add-Member Date $image.ModifiedTime
  Write-Output $Output}
}


### Resource manager
Add-AzureRmAccount
