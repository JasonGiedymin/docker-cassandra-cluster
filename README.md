docker-cassandra-cluster
------------------------

Basic cluster script for cassandra using docker.

This is meant for local development, though you could
boot this up onto a docker-machine cluster. If you do
indeed embark on that journey pay particular attention
to the port specs in the compose yaml. It may be more
than you'd want for production. Also consider a service
container exposed with ports that are linked instead.
