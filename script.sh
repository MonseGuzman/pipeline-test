#!/bin/bash
 
# version=$(git rev-list --count circleci-project-setup)
version=$(chmod +x version-git.sh && ./version-git.sh)

SET THE FOLLOWING VARIABLES
set -ex
# docker hub username
USERNAME=monseguzman
# image name
IMAGE=api-caas

# docker build -t $USERNAME/$IMAGE:latest .

# install git
sudo apt install git-all

# login gitlab
git config --global user.name "Your name here"
git config --global user.email "your_email@example.com"

# get the repository
git clone #repository
# get changes
git fetch
git pull origin master

# bump version
docker run --rm -v "$PWD":/app treeder/bump patch
echo "version: $version"
# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "v $version"
git push
git push --tags
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version

# login github
git config --global user.name "Your name here"
git config --global user.email "your_email@example.com"
