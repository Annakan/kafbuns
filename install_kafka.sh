#!/usr/bin/env bash
sudo yum update
#sudo yum groupinstall -y 'Development Tools'
sudo yum install -y java

kafka_version=0.8.2.1
kafka_name=kafka_2.10-$kafka_version
kafka_filename=$kafka_name.tgz
if [[ ! -e $kafka_filename ]]; then
    echo "Downloading Kafka, please wait..."
    wget -q http://apache.mirrors.hoobly.com/kafka/$kafka_version/$kafka_filename
    echo "Download complete, finishing install"
    else
      printf "$kafka_name is already downloaded\n"
fi
tar -zxvf $kafka_filename
#ln -s $kafka_filename kafka
cd $kafka_name
ipaddr=$(hostname -I)
echo "host.name=$ipaddr" >> config/server.properties
echo "Installation complete! Starting Kafka"
bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/kafka-server-start.sh config/server.properties &
echo "done"

