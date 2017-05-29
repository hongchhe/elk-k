Kibana image
==================

Description
-----------
This repo contains the files for building the Apache Kibana docker image.

Usage
-----
```
#### update elasticsearch server ip in config/kibana.yml

#### build docker image
```
sudo docker build -t k1 .
```
#### run kibana as a standalone service
```
sudo docker run -d -p 5601:5601 k1
```
This will return the container id
#### check the running logs
```
docker logs <container id>
```
#### test the UI
```
http://127.0.0.1:5601
```
