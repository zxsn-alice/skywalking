#!/bin/sh

absolute_path="/skywalking/config/application.yml"

echo "replace {ES_CLUSTER_NAME} to ${ES_CLUSTER_NAME}"
eval sed -i -e 's/\{ES_CLUSTER_NAME\}/${ES_CLUSTER_NAME}/' ${absolute_path}

echo "replace {ES_ADDRESSES} to ${ES_ADDRESSES}"
eval sed -i -e 's/\{ES_ADDRESSES\}/${ES_ADDRESSES}/' ${absolute_path}


echo "replace {NAMING_BIND_HOST} to ${NAMING_BIND_HOST}"
eval sed -i -e 's/\{NAMING_BIND_HOST\}/${NAMING_BIND_HOST}/' ${absolute_path}

echo "replace {NAMING_BIND_PORT} to ${NAMING_BIND_PORT}"
eval sed -i -e 's/\{NAMING_BIND_PORT\}/${NAMING_BIND_PORT}/' ${absolute_path}

echo "replace {REMOTE_BIND_HOST} to ${REMOTE_BIND_HOST}"
eval sed -i -e 's/\{REMOTE_BIND_HOST\}/${REMOTE_BIND_HOST}/' ${absolute_path}

echo "replace {REMOTE_BIND_PORT} to ${REMOTE_BIND_PORT}"
eval sed -i -e 's/\{REMOTE_BIND_PORT\}/${REMOTE_BIND_PORT}/' ${absolute_path}

echo "replace {AGENT_GRPC_BIND_HOST} to ${AGENT_GRPC_BIND_HOST}"
eval sed -i -e 's/\{AGENT_GRPC_BIND_HOST\}/${AGENT_GRPC_BIND_HOST}/' ${absolute_path}

echo "replace {AGENT_GRPC_BIND_PORT} to ${AGENT_GRPC_BIND_PORT}"
eval sed -i -e 's/\{AGENT_GRPC_BIND_PORT\}/${AGENT_GRPC_BIND_PORT}/' ${absolute_path}

echo "replace {AGENT_JETTY_BIND_HOST} to ${AGENT_JETTY_BIND_HOST}"
eval sed -i -e 's/\{AGENT_JETTY_BIND_HOST\}/${AGENT_JETTY_BIND_HOST}/' ${absolute_path}

echo "replace {AGENT_JETTY_BIND_PORT} to ${AGENT_JETTY_BIND_PORT}"
eval sed -i -e 's/\{AGENT_JETTY_BIND_PORT\}/${AGENT_JETTY_BIND_PORT}/' ${absolute_path}

echo "replace {UI_JETTY_BIND_PORT} to ${UI_JETTY_BIND_PORT}"
eval sed -i -e 's/\{UI_JETTY_BIND_PORT\}/${UI_JETTY_BIND_PORT}/' ${absolute_path}

echo "replace {UI_JETTY_BIND_HOST} to ${UI_JETTY_BIND_HOST}"
eval sed -i -e 's/\{UI_JETTY_BIND_HOST\}/${UI_JETTY_BIND_HOST}/' ${absolute_path}


exec "$@"