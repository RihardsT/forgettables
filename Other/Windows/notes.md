### Pin to start
When windows 11 is annoying and has removed the "Pin to Start" from right click menu,
you can workaround by it by adding your shortcut in  
`C:\Users\USERNAME_HERE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs`  
and then finding it in Start menu, pinning from there.


### If windows keeps adding keyboard layout
First remove the biggest annoyance, which is `Ctrl + Shift` shortcut,
that switches between one language layouts:
Settings -> Time & Language -> Typing -> Advanced keyboard settings ->
Input language hotkeys -> Change key sequence -> Set `Not assinged` to all there.

##### Try removing the layout with Powershell. These didn't give the result I wanted though
https://stackoverflow.com/questions/61370537/overwrite-input-method-list-in-windows-10

Had a case, where there's a layout added,
but not shown in Keyboard settings -> Language Options.

First `Get-WinUserLanguageList` check the `InputMethodTips`.  
Add the wrongfully loaded layout in Language Options,
check `Get-WinUserLanguageList` and make note of the different `InputMethodTips`.
Open Registry and go to `HKEY_CURRENT_USER\Keyboard Layout\Preload`
and remove the unwanted layout from there.

In the end ^^ didn't seem to work.
After restart or update the layout was still added.


Remove wrongfully added.
```powershell
# Add the hidden layout

# Set the wrong layout - LV standard or such
Set-WinDefaultInputMethodOverride -InputTip '0426:00000426'
# Set the correct layout LV qwerty
Set-WinDefaultInputMethodOverride -InputTip '0426:00010426'

# Delete the wrong layout from Registry
$KEY_PATH = "HKCU:\Keyboard Layout\Preload"
$KEYBOARD_LAYOUT_KEY = Get-ItemProperty -Path $KEY_PATH | Select-String -Pattern '.=00000426' -All | ForEach-Object { $_.Matches.Value } | ForEach-Object {$_.Substring(0,1)}
Get-ItemProperty -Path "HKCU:\Keyboard Layout\Preload" -Name $KEYBOARD_LAYOUT_KEY
Remove-ItemProperty -Path "HKCU:\Keyboard Layout\Preload" -Name $KEYBOARD_LAYOUT_KEY
# Still the layout is shown.

# For default, do it as Admin, but it doesn't help anyway.
$KEY_PATH = "REGISTRY::HKEY_USERS\.DEFAULT\Keyboard Layout\Preload"
$KEYBOARD_LAYOUT_KEY = Get-ItemProperty -Path $KEY_PATH | Select-String -Pattern '.=00000426' -All | ForEach-Object { $_.Matches.Value } | ForEach-Object {$_.Substring(0,1)}
Write-Output $KEYBOARD_LAYOUT_KEY
Get-ItemProperty -Path $KEY_PATH -Name $KEYBOARD_LAYOUT_KEY
Remove-ItemProperty -Path $KEY_PATH -Name $KEYBOARD_LAYOUT_KEY


Get-ItemProperty -Path "HKCU:\Control Panel\International\User Profile\lv" -Name '0426:00000426'
Remove-ItemProperty -Path "HKCU:\Control Panel\International\User Profile\lv" -Name '0426:00000426'

Computer\HKEY_CURRENT_USER\Control Panel\International\User Profile\lv
```
