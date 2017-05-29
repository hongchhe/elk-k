#!/bin/bash

CONF_FILE=/opt/elasticsearch/config/elasticsearch.yml

: ${CLUSTER_NAME:=docker-cluster}
: ${NODE_NAME:=node-1}
: ${NODE_MASTER:=true}
: ${NODE_DATA:=true}
: ${NODE_INGEST:=true}
: ${PATH_DATA:="\/opt\/elasticsearch\/data"}
: ${PATH_LOGS:="\/opt\/elasticsearch\/logs"}
: ${MEMORY_LOCK:=false}
: ${NETWORK_HOST:=0.0.0.0}
: ${HTTP_PORT:=9200}
: ${UNICAST_HOSTS:=[\"127.0.0.1\", \"[::1]\"]}
: ${MINIMUM_MASTER_NODES:=1}
: ${RECOVER_AFTER_NODES:=1}
: ${RECOVER_AFTER_TIME:=5m}
: ${EXPECTED_NODES:=0}
: ${CLIENT_SSL_AUTH:=none}


sed -i ${CONF_FILE} -e "s/{{clusterName}}/${CLUSTER_NAME}/" 
sed -i ${CONF_FILE} -e "s/{{nodeName}}/${NODE_NAME}/" 
sed -i ${CONF_FILE} -e "s/{{nodeMaster}}/${NODE_MASTER}/" 
sed -i ${CONF_FILE} -e "s/{{nodeData}}/${NODE_DATA}/" 
sed -i ${CONF_FILE} -e "s/{{nodeIngest}}/${NODE_INGEST}/" 
sed -i ${CONF_FILE} -e "s/{{pathData}}/${PATH_DATA}/" 
sed -i ${CONF_FILE} -e "s/{{pathLogs}}/${PATH_LOGS}/" 
sed -i ${CONF_FILE} -e "s/{{memoryLock}}/${MEMORY_LOCK}/" 
sed -i ${CONF_FILE} -e "s/{{networkHost}}/${NETWORK_HOST}/" 
sed -i ${CONF_FILE} -e "s/{{httpPort}}/${HTTP_PORT}/"
sed -i ${CONF_FILE} -e "s/{{unicastHosts}}/${UNICAST_HOSTS}/" 
sed -i ${CONF_FILE} -e "s/{{minimumMasterNodes}}/${MINIMUM_MASTER_NODES}/"
sed -i ${CONF_FILE} -e "s/{{recoverAfterNodes}}/${RECOVER_AFTER_NODES}/"
sed -i ${CONF_FILE} -e "s/{{recoverAfterTime}}/${RECOVER_AFTER_TIME}/"
sed -i ${CONF_FILE} -e "s/{{expectedNodes}}/${EXPECTED_NODES}/"
sed -i ${CONF_FILE} -e "s/{{clientSSLAuth}}/${CLIENT_SSL_AUTH}/"

#./bin/elasticsearch-plugin install file:///opt/elasticsearch/x-pack-${XPACK_VERSION}.zip

elasticsearch