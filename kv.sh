#!/bin/bash

export CONSUL_HTTP_ADDR=127.0.0.1:8500

consul join -h

host=host
name=postgres
port=80

echo $host | consul kv put POSTGRESQL_HOST -
echo $name | consul kv put POSTGRESQL_NAME -
echo $port | consul kv put POSTGRESQL_PORT -
