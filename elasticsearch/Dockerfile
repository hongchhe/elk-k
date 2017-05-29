FROM       hongchhe/ubuntu-python
MAINTAINER hehongchuang@gmail.com

EXPOSE     9200 9300

ENV        ES_VERSION=5.2.1
ENV        XPACK_VERSION=${ES_VERSION}
ENV        ES_PKG_NAME=elasticsearch-${ES_VERSION}
ENV        PATH=${ES_HOME}/bin:$PATH
ENV        BASE_URL=https://artifacts.elastic.co/downloads/elasticsearch/
ENV        ES_HOME=${ES_HOME}

RUN        mkdir -p ${ES_HOME} \
        && wget  -q -O - BASE_URL/${ES_PKG_NAME}.tar.gz | tar -xzC ${ES_HOME} --strip-components=1 \
        && groupadd -r elasticsearch \
        && useradd -r -g elasticsearch elasticsearch \
        && cp ${ES_HOME}/config/elasticsearch.yml ${ES_HOME}/config/elasticsearch.yml.bak

#RUN        curl -o ${ES_HOME}/x-pack-${XPACK_VERSION}.zip https://artifacts.elastic.co/downloads/packs/x-pack/x-pack-${XPACK_VERSION}.zip

COPY       config/elasticsearch.yml ${ES_HOME}/config/elasticsearch.yml
COPY       run.sh ${ES_HOME}

RUN        chown -R elasticsearch ${ES_HOME} && chgrp -R elasticsearch ${ES_HOME} \
        && chmod +x ${ES_HOME}/run.sh

WORKDIR    ${ES_HOME}

USER       elasticsearch

ENTRYPOINT ["${ES_HOME}/run.sh"]
