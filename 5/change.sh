#!/bin/sh

echo "!!!!!!!!!!!!!!!! chang.sh !!!!!!!!!!!!!!"

ES_CONF="config/elasticsearch.yml"
change_properties() {
	local file=$1
	local key_name=$2
	local value=$3
	if [ ! -z "$value" ]; then
		echo "change : $key_name=$value ($file)"
		cmd="sed -i -e '/$key_name:/s/:.*/: $value/' $file"
		eval $cmd
	fi
}

change_properties $ES_CONF 'discovery.zen.ping.unicast.hosts' $UNICAST_HOSTS
change_properties $ES_CONF 'discovery.zen.minimum_master_nodes' $MINIMUM_MASTER_NODE
change_properties $ES_CONF 'node.master' $NODE_MASTER
change_properties $ES_CONF 'node.data' $NODE_DATA
change_properties $ES_CONF 'node.max_local_storage_nodes' $MAX_LOCAL_STORAGE_NODES