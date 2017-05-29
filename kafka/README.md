# kafka
This repo contains the files for building the Apache Kafka docker image.

**Please notice**: It is a standalone zoozeepker + kafka image. not works with kafka server cluster mode. 

## NOTE

**Please notice** : The `master` branch is not Working now !!!  Please make sure to checkout `standalone-0.10.1.1` branch. the `standalone-0.10.1.1` contains the latest kafka release version `kafka_2.11-0.10.1.1`


## The sandalone mode kafka 

###  Installation 

```
#### docker build standalone kafka image

```
docker build -t kafka .
```
#### docker run the image

```
docker run -p 2181:2181 -p 9092:9092 kafka
```
### Testing 

#### Install the kafka client

Download kafka version 0.10.1.1

```
curl -O http://www-us.apache.org/dist/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz
tar xzvf kafka_2.11-0.10.1.1.tgz
cd kafka_2.11-0.10.1.1
```

#### Test kafka

Create a topic

```
$ bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```
list the topic

```
$ bin/kafka-topics.sh --list --zookeeper localhost:2181
test
```
Send a messages

```
$ bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
hello kafka
```
Receive the message

```
$ bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
hello kafka
```

See more from the offical guide 

* [kafka offical quick-start guide latest][2]

[2]:https://kafka.apache.org/quickstart
