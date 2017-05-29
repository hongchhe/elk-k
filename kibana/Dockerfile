FROM       hongchhe/ubuntu-python
MAINTAINER hehongchuang@gmail.com

ARG        BUILD_DATE
ARG        VCS_REF
ARG        IMAGE_TAG

ENV        KIBANA_VERSION=5.2.1
ENV        REPO_BASE https://artifacts.elastic.co/downloads/kibana
ENV ES_HOST=127.0.0.1

RUN        yum localinstall -y ${REPO_BASE}/kibana-${KIBANA_VERSION}-x86_64.rpm \
        && yum clean all

EXPOSE 5601
 
RUN cp /etc/kibana/kibana.yml /etc/kibana/kibana.yml.bak
COPY config/kibana.yml /etc/kibana/kibana.yml

#RUN sed -i "s/localhost/${ES_HOST}/g" /etc/kibana/kibana.yml

COPY run.sh /
RUN  chmod 755 /run.sh
CMD  /run.sh

