# docker-fluentd-zabbix

## docker-run

```
docker run -d -e ZABBIX_SERVER=172.16.31.40 -e ACTIVE_CHECK_PORT=10051 -e ES_SERVER=172.16.31.40 -e ES_PORT=9200 -v /var/log/container/nginx:/var/log/nginx stake/docker-fluentd-zabbix
```
