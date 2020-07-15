#!/bin/bash

# install consul
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install consul

# use consul
export CONSUL_HTTP_ADDR=127.0.0.1:8500

consul join -h

host=host
name=postgres
port=80

echo $host | consul kv put POSTGRESQL_HOST -
echo $name | consul kv put POSTGRESQL_NAME -
echo $port | consul kv put POSTGRESQL_PORT -
