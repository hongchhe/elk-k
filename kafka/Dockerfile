FROM       centos:7
MAINTAINER hehongchuang@gmail.com

RUN        yum update -y \
        && yum install -y java-1.8.0-openjdk \
        && yum clean all \
        && rm -rf /var/cache/yum

ENV        SCALA_VERSION 2.12
ENV        KAFKA_VERSION 2.1.1
ENV        KAFKA_HOME /opt/kafka
ENV        REPO_BASE http://mirrors.hust.edu.cn/apache/kafka

RUN        mkdir -p ${KAFKA_HOME} \
        && curl ${REPO_BASE}/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | tar -xzC ${KAFKA_HOME} --strip-components=1

ENV        KAFKA_CONFIG_DIR=${KAFKA_HOME}/config
COPY       config/server.properties ${KAFKA_CONFIG_DIR}/server.properties
COPY       run.sh /tmp

RUN        chmod 755 /tmp/run.sh \
        && groupadd -r kafka \
        && useradd --comment "Kafka Daemon User" --shell /bin/bash -M -r -g kafka --home ${KAFKA_HOME} kafka \
        && chown -R kafka:kafka ${KAFKA_HOME}

EXPOSE     2181 9092 9093 9094 9095

WORKDIR    ${KAFKA_HOME}

ENTRYPOINT ["/tmp/run.sh"]