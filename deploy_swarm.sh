#!/bin/bash

# Initialize Docker Swarm
docker swarm init --advertise-addr <manager_public_ip>

# Get the join token for worker nodes
join_token=$(docker swarm join-token -q worker)

# Get the IP address of the manager node
manager_ip=$(hostname -I | awk '{print $1}')

# Join worker nodes to the Swarm
for ip in "${NODE_IPS[@]}"; do
  ssh -o "StrictHostKeyChecking=no" -i "${{ secrets.SSH_PRIVATE_KEY }}" ubuntu@$ip "docker swarm join --token $swarm_token $manager_ip:2377"
done

# # Join worker nodes to the Swarm
# docker swarm join --token $join_token <manager_public_ip>:22

# Deploy services and containers to the Swarm
docker stack deploy --compose-file compose.yaml everyshilling