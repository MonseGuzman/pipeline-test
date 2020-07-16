#!/bin/bash
 
version=$(git rev-list --count circleci-project-setup)
finalVersion=''

if [ "$version" -le 20 ];
then
    echo "$version"
else
    finalVersion = ".$version"
    echo "finalVersion"
fi