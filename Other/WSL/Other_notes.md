### Errors with Windows
```
# Logon failure: the user has not been granted the requested logon type at this computer
# In Admin Powershell
Get-Service vmcompute | Restart-Service

# Get the nameservers on the Windows host
Get-DnsClientServerAddress | Select-Object –ExpandProperty ServerAddresses
```
