FROM       hongchhe/ubuntu-python
MAINTAINER hehongchuang@gmail.com

EXPOSE     2181 9092

ENV        KAFKA_VERSION 0.10.1.1
ENV        KAFKA_HOME /opt/kafka
ENV        REPO_BASE http://www-us.apache.org/dist/kafka

RUN        mkdir -p ${KAFKA_HOME}
RUN        wget ${REPO_BASE}/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz -O ${KAFKA_HOME}/kafka_2.11-${KAFKA_VERSION}.tgz 

RUN        cd ${KAFKA_HOME} && tar xvf kafka_2.11-${KAFKA_VERSION}.tgz

RUN        ln -s ${KAFKA_HOME}/kafka_2.11-${KAFKA_VERSION} ${KAFKA_HOME}/default

RUN        rm ${KAFKA_HOME}/kafka_2.11-${KAFKA_VERSION}.tgz

RUN        groupadd -r kafka \
        && useradd --comment "Kafka Daemon User" --shell /bin/bash -M -r -g kafka --home ${KAFKA_HOME}/default kafka \
        && chown -R kafka:kafka ${KAFKA_HOME}

RUN        mkdir /etc/kafka

COPY       server.properties          /etc/kafka/server.properties
COPY       run.sh                     /tmp

RUN        chmod 755 /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]

