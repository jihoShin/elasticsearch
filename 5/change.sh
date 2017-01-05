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
		echo $cmd
		eval $cmd	
		echo ""
	fi
}

change_properties_2(){

	local file=$1
	local key_name=$2
	local value=$3
	if [ ! -z "$value" ]; then
		echo "change2 : $key_name => $value ($file)"
		cmd="sed -i -e 's|$key_name|$value|' $file"
		echo $cmd
		eval $cmd
		echo ""
	fi
}


change_properties $ES_CONF 'network.host' $NETWORK_HOST
change_properties $ES_CONF 'cluster.name' $CLUSTER_NAME
change_properties $ES_CONF 'cloud.aws.region' $CLOUD_AWS_REGION
change_properties $ES_CONF 'discovery.zen.minimum_master_nodes' $DISC_MIN_MASTER_NODE
change_properties $ES_CONF 'discovery.ec2.groups' $DISC_EC2_GROUPS
change_properties $ES_CONF 'discovery.ec2.availability_zones' $DISC_EC2_AZ
change_properties $ES_CONF 'node.master' $NODE_MASTER
change_properties $ES_CONF 'node.data' $NODE_DATA
change_properties $ES_CONF 'node.max_local_storage_nodes' $MAX_LOCAL_STORAGE_NODES
change_properties $ES_CONF 'xpack.monitoring.enabled' $XPACK_MONITORING_ENABLED

change_properties_2 $ES_CONF 'accessKey' $CLOUD_AWS_ACCESS_KEY
change_properties_2 $ES_CONF 'secretKey' $CLOUD_AWS_SECRET_KEY
