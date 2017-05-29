FROM       hongchhe/ubuntu-python
MAINTAINER hehongchuang@gmail.com

EXPOSE     8080 9600 

ENV        LOGSTASH_VERSION 5.2.1
ENV        REPO_BASE https://artifacts.elastic.co/downloads/logstash

RUN        yum localinstall --nogpgcheck -y ${REPO_BASE}/logstash-${LOGSTASH_VERSION}.rpm \
        && yum clean all

COPY        conf/logstash.conf /tmp/logstash.conf

COPY        run.sh /tmp

RUN        chmod 500 /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]

