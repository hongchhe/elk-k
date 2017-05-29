Elasticsearch image
==================

Description
-----------
This repository contains a Dockerfile for building a docker image that runs the elastic search 


Building Docker Image
---------------------


Prerequisites
-------------
* Recommend installing the Java 8 update 20 or later, or Java 7 update 55 or later.
* The vm_max_map_count kernel setting needs to be set to at least 262144 for production use. You can refer to the "Production mode" section of https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

Usage
-----
#### build docker image
```
docker build -t elastic1 .
```
#### run elasticsearch as a standalone service
```
docker run -d -p 9200:9200 -p 9300:9300 elastic1 
```
This will return the container id
#### check the running the logs
```
docker logs <container id>
```
#### test if it works
```
curl http://127.0.0.1:9200
```
