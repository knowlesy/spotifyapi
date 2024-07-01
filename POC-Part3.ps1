$spotifyUsername = ""
$path = ""

$date = Get-Date -Format yyyy-MM-dd
$playlistName = $date + "-BooheyStream"


$file = Get-Content $path

Update-SpotifyAccessToken

$newPlaylist = New-SpotifyPlaylist -Name $playlistName -UserId $spotifyUsername -Public

[string]$playlistID = $newPlaylist.id

$songLookup = Find-SpotifyItem -Query $file -Type track

[string]$songID = $songLookup[0].uri

$songURIJson = @"
{
  "uris":[
   "$songID"
  ]
}
"@

Invoke-RestMethod `
-Uri "https://api.spotify.com/v1/playlists/$playlistID/tracks/" `
-Method Post `
-Authentication Bearer `
-Token $global:SpotifyToken `
-ContentType "application/json" `
-Body $songURIJson
