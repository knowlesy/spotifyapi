$clientId = ""
$clientSecret = ""
$spotifyUsername = ""
$path = ""

$date = Get-Date -Format yyyy-MM-dd

$playlistName = $date + "-Stream"


$file = Get-Content $path

Install-Module -Name Spotishell
Import-Module Spotishell

New-SpotifyApplication -ClientId $clientId -ClientSecret $clientSecret


New-Playlist -UserId $spotifyUsername -Public $True -Name $playlistName -Description "Playlist made from Stream on $date" 
$playlistID = Get-UserPlaylists $spotifyUsername | Where-Object {$_.Name -eq $playlistName}

$lookup = Search-Item -Query $file -type track

Add-PlaylistItem -Id $playlistID.id -ItemId $lookup.tracks.items[0].id