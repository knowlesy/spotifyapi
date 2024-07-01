
#enter details here from your app config from spotify dev
$clientId = ""
$clientSecret = ""
$spotifyUsername = ""
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

[string]$test = $token.access_token
