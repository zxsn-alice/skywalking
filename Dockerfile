#FROM openjdk:8-jre-alpine
# COPY apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz ./
# RUN tar -zxvf apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz -C /usr/local/ \
#       && mv /usr/local/apache-skywalking-apm-incubating/ /skywalking/ 
# RUN      export ES_JAVA_OPTS='-Xms512m -Xmx512m'; 
# RUN  rm -rf apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz
# WORKDIR /skywalking
# RUN chmod +x /skywalking/bin/startup.sh \
# && echo "tail -f /dev/null" >> /skywalking/bin/startup.sh 

# CMD [ "./bin/startup.sh" ]
# #ENTRYPOINT ./bin/startup.sh
FROM alpine:3.8 AS sky-builder

# after ADD unzip does not work?
ADD http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/skywalking/5.0.0-beta2/apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz /

RUN tar -zxvf /apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz

FROM java:openjdk-8u111-jre

ENV ES_CLUSTER_NAME=CollectorDBCluster \
    ES_ADDRESSES=localhost:9300 \
    NAMING_BIND_HOST=0.0.0.0 \
    NAMING_BIND_PORT=10800 \
    REMOTE_BIND_HOST=0.0.0.0  \
    REMOTE_BIND_PORT=11800 \
    AGENT_GRPC_BIND_HOST=0.0.0.0 \
    AGENT_GRPC_BIND_PORT=11800 \
    AGENT_JETTY_BIND_HOST=0.0.0.0 \
    AGENT_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_HOST=0.0.0.0

COPY --from=sky-builder /apache-skywalking-apm-incubating /skywalking

#COPY application.yml /skywalking/config/application.yml

COPY docker-entrypoint.sh /docker-entrypoint.sh

# logs locations in /sky/logs folder.

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone \
    && chmod +x /docker-entrypoint.sh \
    && chmod +x /skywalking/bin/startup.sh \
    && echo "tail -f /dev/null" >> /skywalking/bin/startup.sh \
    && rm -rf /skywalking/agent

EXPOSE 8080 10800 11800 12800

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/skywalking/bin/startup.sh"]