#!/bin/bash
#set -xv

# Variables
KAFKA_CONFIG=${KAFKA_CONFIG_DIR}/server.properties
KAFKA_USER="kafka"
#HOST_IP=$(ip -o -4 addr show eth0|awk '{print $4}'|cut -d/ -f1)
HOST_IP=$(tail -n 1 /etc/hosts | awk '{print $1}')

: ${LISTENERS_PORT:=9092}
: ${ADVERTISED_HOST:=$HOST_IP}
: ${ADVERTISED_PORT:=9092}

: ${BROKER_ID:=`hostname | egrep -o '[1-9]*$'`}
: ${BROKER_ID:=0}
: ${LISTENERS:=PLAINTEXT://:$LISTENERS_PORT}
: ${LOG_DIRS:=/tmp/kafka-logs}
: ${NUM_PARTITIONS:=1}
: ${ZOOKEEPER_CONNECT:=localhost:2181}
: ${ADVERTISED_LISTENERS:=PLAINTEXT://$ADVERTISED_HOST:$ADVERTISED_PORT}

# Check whether the config file exists
if [ ! -f $KAFKA_CONFIG ]; then
  echo "No kafka configuration file ($KAFKA_CONFIG) is found!"
  exit 1
fi


#Configure kafka
sed -i ${KAFKA_CONFIG} -e "s/{{BROKER_ID}}/${BROKER_ID}/"
sed -i ${KAFKA_CONFIG} -e "s#{{LISTENERS}}#${LISTENERS}#"
sed -i ${KAFKA_CONFIG} -e "s#{{LOG_DIRS}}#${LOG_DIRS}#"
sed -i ${KAFKA_CONFIG} -e "s/{{ZOOKEEPER_CONNECT}}/${ZOOKEEPER_CONNECT}/"
sed -i ${KAFKA_CONFIG} -e "s/{{NUM_PARTITIONS}}/${NUM_PARTITIONS}/"
sed -i ${KAFKA_CONFIG} -e "s#{{ADVERTISED_LISTENERS}}#${ADVERTISED_LISTENERS}#"

sp_arr=(${ZOOKEEPER_CONNECT//:/ })
if [[ ${sp_arr[0]}="localhost" || ${sp_arr[0]}="127.0.0.1" ]]; then
	#start the zookeeper on localhost
	echo "Start zookeeper ..."
	/sbin/runuser $KAFKA_USER -c "$KAFKA_HOME/bin/zookeeper-server-start.sh ${KAFKA_CONFIG_DIR}/zookeeper.properties &"
fi

#Start kafka
echo "Start kafka ..."
/sbin/runuser $KAFKA_USER -c "$KAFKA_HOME/bin/kafka-server-start.sh ${KAFKA_CONFIG}"
