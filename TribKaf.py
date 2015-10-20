#!/usr/bin/env python
# -*- coding: utf-8 -*-
from kafka import KafkaConsumer
from kafka.consumer.simple import SimpleConsumer
from kafka.client import KafkaClient

# To consume messages
# consumer = KafkaConsumer('tribun',
#                          ## group_id='my_group',
#                          bootstrap_servers)

bootstrap_servers=['tribun-tst-http:9092']

client = KafkaClient(bootstrap_servers)

consumer = SimpleConsumer(client, None, 'tribun')


consumer.seek(0, 0)
for message in consumer:
    # message value is raw byte string -- decode if necessary!
    # e.g., for unicode: `message.value.decode('utf-8')`
#    print("%s:%d:%d: key=%s value=%s" % (message.topic, message.partition,
#                                         message.offset, message.key,
#                                         message.value))
    print("OFFSET: "+str(message[0])+"\t MSG: "+str(message[1][3]))
