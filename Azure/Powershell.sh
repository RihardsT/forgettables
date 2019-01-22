docker run --rm -ti -v $PWD:/d -v $PWD/PSmodules:/e mcr.microsoft.com/powershell
$modulePath = [Environment]::GetEnvironmentVariable('PSModulePath');
$modulePath += ':/e'
[Environment]::SetEnvironmentVariable('PSModulePath', $modulePath)

### Azure commandlets
# Save Az module locally
Find-Module -Name 'Az' -Repository 'PSGallery' | Save-Module -Path '/e'

# Set module path, to load Az
$modulePath = [Environment]::GetEnvironmentVariable('PSModulePath')
$modulePath += ':/e'
[Environment]::SetEnvironmentVariable('PSModulePath', $modulePath)

# List modules
Get-Module -ListAvailable



### Azure module ! note for docker build7
Install-Module -Name Az -AllowClobber
#
Connect-AzAccount
Enable-AzureRmAlias
