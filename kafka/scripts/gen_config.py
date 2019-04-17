# -*- coding: utf-8 -*-

from jinja2 import Environment
from jinja2.loaders import FileSystemLoader

fileName = "server.properties"
env = Environment(loader=FileSystemLoader('templates'))
tmpl = env.get_template(fileName)

varDict = {
    'BROKER_ID': 0,
    'LISTENERS': 'PLAINTEXT://:9092',
    'LOG_DIRS': '/tmp/kafka-logs',
    'NUM_PARTITIONS': '1',
    'ZOOKEEPER_CONNECT': 'localhost:2181',
    'ADVERTISED_LISTENERS': 'PLAINTEXT://:9092'
}
saveFile = "{0}/{1}".format("../config", fileName)

with open(saveFile, 'w') as f:
    f.write(tmpl.render(varDict))
