sed -i "s/localhost/${ES_HOST}/g" /etc/kibana/kibana.yml
/usr/share/kibana/bin/kibana serve --verbose

