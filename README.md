docker-cassandra-cluster
------------------------

Basic cluster script for cassandra using docker.

This is meant for local development, though you could
boot this up onto a docker-machine cluster. If you do
indeed embark on that journey pay particular attention
to the port specs in the compose yaml. It may be more
than you'd want for production. Also consider a service
container exposed with ports that are linked instead.

## Get Going
```shell
bash cluster.sh up
```

## Logging to file
```shell
COMPOSE_LOG=true bash cluster.sh up
```

## With volume mounts
1. Uncomment `createData()` calls in `cluster.sh`.
1. Uncomment `volume` entries in `docker-compose.yml`
1. Re-run script (see above)
