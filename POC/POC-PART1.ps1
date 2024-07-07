$clientId = ""
#need a check for powershell core 
New-Item -Path "c:\temp" -ItemType Directory -ErrorAction Ignore
New-Item -Path "c:\Spotify" -ItemType Directory -ErrorAction Ignore
# https://www.virustotal.com/gui/file/c1258a5082644f7b4bc80ac57cb2b23323c668f2760f1137160b936edccafb2b?nocache=1
Invoke-WebRequest -Uri "https://github.com/lennyomg/Spotify-PowerShell/releases/download/1.0.66/Spotify-PowerShell-1.0.66.zip" -OutFile "c:\temp\Spotify-PowerShell-1.0.66.zip"

Expand-Archive -Path "c:\temp\Spotify-PowerShell-1.0.66.zip" -DestinationPath c:\

Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
Import-Module "C:\Spotify\Spotify.psm1" 
#Update-SpotifyAccessToken


$url = New-SpotifyAccessToken -ClientId $clientId -PassThru
Start-Process $url


