
#enter details here from your app config from spotify dev
$clientId = ""
$clientSecret = ""
$redirectUrl = "http://127.0.0.1:1300/spotifyOAuthRedirectUri/"



#config to get your token
$body = @{
    grant_type= 'client_credentials'
    redirect_uri= $redirectUrl
    client_id= $clientId
    client_secret= $clientSecret
}

#requests your token
$token = Invoke-RestMethod -Method Post -Uri "https://accounts.spotify.com/api/token" -Body $body

[string]$tokenExtracted = $token.access_token

$secureToken = ConvertTo-SecureString $tokenExtracted -AsPlainText -Force

$playlistid = "0a5x69cEZ5ApzgJgLV7bw4"
Invoke-RestMethod `
-Uri "https://api.spotify.com/v1/playlists/$($PlaylistId)" `
-Method Get `
-Authentication Bearer `
-Token $secureToken `
-ContentType "application/json"


