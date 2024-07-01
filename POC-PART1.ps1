$clientId = ""

Import-Module ./spotify-module/Spotify.psm1
Update-SpotifyAccessToken


$url = New-SpotifyAccessToken -ClientId $clientId -PassThru
Start-Process $url


