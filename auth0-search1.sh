#! /usr/local/bin/bash

TOKEN=$(curl \
    --silent \
    --request POST \
    --url "$PERSONAL_AUTH0_DOMAIN/oauth/token" \
    --header 'content-type: application/x-www-form-urlencoded' \
    --data "audience=$PERSONAL_AUTH0_AUDIENCE&grant_type=client_credentials&client_id=$PERSONAL_AUTH0_CLIENTID&client_secret=$PERSONAL_AUTH0_CLIENT_SECRET" \
    | jq '.access_token' | sed 's/^"//g;s/"$//g')

curl --request GET \
    --url "$PERSONAL_AUTH0_DOMAIN/api/v2/users?q=name:jean*&search_engine=v3" \
    --header "authorization: Bearer $TOKEN"
