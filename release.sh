#!/bin/bash

github-release release \
    --user $GITHUB_USER \
    --repo $PROJECT \
    --tag $CI_VERSION \
    --name $releaseName \
    --description $releaseDescription
