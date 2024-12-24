#!/bin/bash

label="com.a2odev.app=sigma"
memory_limit="64mb"
restart_policy=5
containers=$(docker ps -q --filter "label=$label")

if [ -z "$containers" ]; then
  echo "No containers found with label '$label'"
  exit 1
fi

for container in $containers; do
  echo "Optimizing container $container..."

  memory_limit=$(docker inspect --format '{{.HostConfig.Memory}}' $container)
  memoryswap_limit=$(docker inspect --format '{{.HostConfig.MemorySwap}}' $container)
  
  docker update --memory $memory_limit --memory-swap $memory_limit --restart on-failure:$restart_policy $container

  echo "Updated container $container with the following settings:"
  docker inspect --format '{{.Name}}: Memory: {{.HostConfig.Memory}} MemorySwap: {{.HostConfig.MemorySwap}} RestartPolicy: {{.HostConfig.RestartPolicy.Name}}' $container
done

echo "Optimization completed for matching containers."
