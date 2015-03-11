#!/bin/bash

ZABBIX_SERVER=${ZABBIX_SERVER}
ACTIVE_CHECK_PORT=${ACTIVE_CHECK_PORT}
ES_SERVER=${ES_SERVER}
ES_PORT=${ES_PORT}
CONF=/etc/td-agent/td-agent.conf

if [ -f "$CONF" ]; then
    sed -i "s/__ZABBIX_SERVER__/${ZABBIX_SERVER}/" $CONF
    sed -i "s/__ACTIVE_CHECK_PORT__/${ACTIVE_CHECK_PORT}/" $CONF
    sed -i "s/__ES_SERVER__/${ES_SERVER}/" $CONF
    sed -i "s/__ES_PORT__/${ES_PORT}/" $CONF
fi

/usr/lib64/fluent/ruby/bin/ruby /usr/sbin/td-agent --group td-agent --log /var/log/td-agent/td-agent.log
