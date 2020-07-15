#!/bin/bash

docker-compose build

docker-compose up -d

chmod +x kv.sh

./kv.sh 