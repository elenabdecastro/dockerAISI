#!/bin/bash

cd redis
docker run -d --name redis -p 6379:6379 redis
cd ../node
docker build -t msanand/node .
docker run -d --name node -p 8080 --link redis:redis msanand/node
cd ../nginx
docker build -t msanand/nginx .
docker run -d --name nginx -p 80:80 --link node:node  msanand/nginx
cd ..
