find_clientID <- function(){
    Sys.getenv("SPOTIFY_CLIENTID")
}

find_spotify_secret <- function(){
    Sys.getenv("SPOTIFY_SECRET")
}

#endpoint <- GET https://api.spotify.com/v1/audio-features
# http://rcharlie.com/2017-02-16-fitteR-happieR/
#
get_audio_features <- function(ids){
    baseurl <- "https://api.spotify.com/v1/audio-features"
    url <- httr::modify_url(baseurl, query = list(ids= ids,
                                                  access_token = access_token))
    httr::GET(url = url)
}


# authorize
access_token <- httr::content(httr::POST('https://accounts.spotify.com/api/token',
                     httr::accept_json(), httr::authenticate(find_clientID(), find_spotify_secret()),
                     body = list(grant_type='client_credentials'),
                     encode = 'form', httr::config(http_version=2)))$access_token

