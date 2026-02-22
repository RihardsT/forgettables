##### Kill
# Get list of processes
tasklist | select-string -pattern 'PROCESS_NAME'
taskkill /f /PID PID_OF_THE_PROCESS
Get-Process

# Envrionment variables
Get-ChildItem ENV: # Output all env variables
$ENV:VARIABLE_NAME # Single variable
$HOME # Somehow not included in $ENV
# Set
$Env:VARIABLE_NAME = "VALUE"

###
Get-Help COMMAND -Online

Get-Date -Format "dd/MM/yyyy HH:mm K"

Get-Service | Out-GridView
### Get directory items
Get-ChildItem -Path C:\ | Sort-Object -Property Name | Format-Table -Property Name, Length

$d = Get-Date
$d.GetType()
$d | Select-Object *

# Like grep
Select-String -Pattern 'PATTERN' -All
# grep -o # Only the matched string
| ForEach-Object { $_.Matches.Value }
# Get the first char
| ForEach-Object {$_.Substring(0,1)}

COMMAND | Where-Object { $_.PROPERTY -match "REGEX" }

New-Item -Path "FILENAME" -ItemType File
Remove-Item "FILENAME"
Test-Path "FILENAME"

##### Variable types
[int]$var = 12
[string]$var = '123'
[double]$var = 2.2
Write-Output $VAR
# $VAR.GetType()

$ARR = 1,2,2
$ARR = 1..3
Write-Output $ARR[1]

##### if else
if (Test-Path "PATH") {
  "Heyo"
}
# greater than
if ($VAR1 -gt $VAR2) {
  "Hey"
} elseif ( $VAR1 -lt $VAR2){
  "Hey2"
} else {
  "Last"
}

if ($VAR -like 'REGEX?') {
  "Hey"
}

##### Functions
functions Function-Name {
  param (
    [string]$var
  )
  begin {
    Write-Output "Something before actual funciton stuff"
  }
  process {
    Write-Ouput "Get stuff from pipe: $_"
  }
  end {
    "End"
  }
}
"Piped" | Function-Name -var "Heya"

##### Loops
for ($i = 1; $i -le 10; $i++){
  $i
}

$vals = 1, '2s', 3, '4s'
foreach ($item in $vals){
  $item
  Write-Host $item # Multiple functions to output
  Write-Output $item
}

$i = 3
while ($i -gt 0){
  $i--
  $i
  if ($i -eq 1){
    break
  }
}

##### Execution policy
Get-ExecutionPolicy -List
# As admin?
Set-ExecutionPolicy -ExectionPolicy RemoteSigned -Scope CurrentUser


### Replace, remove from string
$(whoami) -replace "dir\\", ""
### Echo to file with Out-File
"Hello World" | Out-File "c:\Users\$($(whoami) -replace 'dir\\', '')\testfile"
