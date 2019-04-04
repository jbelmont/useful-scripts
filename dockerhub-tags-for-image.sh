#! /bin/bash

IMAGE_NAME=$1

TOKEN_URI="https://auth.docker.io/token"

DOCKERHUB_TOKEN=$(\
    curl --silent --get $TOKEN_URI \
        --data-urlencode "service=registry.docker.io" \
        --data-urlencode "scope=repository:library/$IMAGE_NAME:pull" \
        | jq --raw-output .token
)

LIST_URI="https://registry-1.docker.io/v2/library/$IMAGE_NAME/tags/list"

RESULT=$(curl -s -X GET -H "Accept: application/json" -H "Authorization: Bearer $DOCKERHUB_TOKEN" $LIST_URI)

echo $RESULT | jq '.tags[] | select(test("alpine"))'