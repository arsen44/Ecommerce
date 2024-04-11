FROM docker.elastic.co/elasticsearch/elasticsearch:8.1.3-arm64
ADD ./docker/elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
USER elasticsearch