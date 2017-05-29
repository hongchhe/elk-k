#!/bin/bash
#set -xv

# Variables
KAFKA_CONFIG=/etc/kafka/server.properties
KAFKA_BASEDIR=${KAFKA_HOME}/default
KAFKA_USER="kafka"
HOST_IP=$(ip -o -4 addr show eth0|awk '{print $4}'|cut -d/ -f1)

: ${BROKER_ID:=0}
: ${NUM_PARTITIONS:=1}
: ${ZOOKEEPER_CONNECT:=localhost:2181}
: ${ADVERTISED_HOST:=$HOST_IP}
: ${ADVERTISED_PORT:=9092}
: ${ADVERTISED_LISTENERS:=PLAINTEXT://$ADVERTISED_HOST:$ADVERTISED_PORT}

# Check whether the config file exists
if [ ! -f $KAFKA_CONFIG ]; then
  echo "No kafka configuration file ($KAFKA_CONFIG) is found!"
  exit 1
fi

#Configure kafka 
sed -i ${KAFKA_CONFIG} -e "s/%BROKER_ID%/${BROKER_ID}/" 
sed -i ${KAFKA_CONFIG} -e "s/%ZOOKEEPER_CONNECT%/${ZOOKEEPER_CONNECT}/"
sed -i ${KAFKA_CONFIG} -e "s/%NUM_PARTITIONS%/${NUM_PARTITIONS}/"
sed -i ${KAFKA_CONFIG} -e "s#%ADVERTISED_LISTENERS%#${ADVERTISED_LISTENERS}#"

#Start kafka 
echo "Start kafka ..."
/sbin/runuser $KAFKA_USER -c "$KAFKA_BASEDIR/bin/zookeeper-server-start.sh $KAFKA_BASEDIR/config/zookeeper.properties &"
/sbin/runuser $KAFKA_USER -c "$KAFKA_BASEDIR/bin/kafka-server-start.sh ${KAFKA_CONFIG}"

