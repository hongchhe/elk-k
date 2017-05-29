# logstash 5.2.1



# Build
```
docker build -f Dockerfile . -t logstash
docker run --rm -it  -p 8080:8080 -e "ELASTIC_HOST=172.17.0.2:9200" -e "KAFKA_TOPIC=test" -e "KAFKA_ZK=172.17.0.3:9092" logstash
```

_Send message a message_
```

curl -H "content-type: application/json" -XPUT 'http://127.0.0.1:8080/twitter/tweet/1' -d '{
    "user" : "kimchy",
    "post_date" : "2009-11-15T14:12:12",
    "message" : "trying out Elasticsearch"
}'

curl -XPUT 'http://127.0.0.1:8080/twitter/tweet/1' -d 'hello'  

```
_Receive the message_

curl localhost:9200/_cat/indices?v





