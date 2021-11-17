#!/bin/bash



curl  -X GET localhost:5000/v2/hello-world/tags/list
docker images | tail -10


docker tag localhost:5000/hello-world:tp  localhost:5000/hello-world:mylasttag

docker push localhost:5000/hello-world:mylasttag

curl -X GET localhost:5000/v2/hello-world/tags/list
docker images | tail -10
