#!/bin/bash

# Initialize Docker Swarm
docker swarm init --advertise-addr <manager_public_ip>

# Get the join token for worker nodes
join_token=$(docker swarm join-token -q worker)

# Join worker nodes to the Swarm
docker swarm join --token $join_token <manager_public_ip>:22
