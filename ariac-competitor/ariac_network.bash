#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# networking
inspect=`docker network inspect ariac-network`
# echo $inspect
if [ inspect ]
then
  echo "replacing ariac-network"
  docker network rm ariac-network
fi

docker network create -d bridge \
  --subnet=172.200.0.0/16 \
  ariac-network
