FROM centos:centos6

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN localedef -f UTF-8 -i ja_JP ja_JP

# Update base images.
RUN yum distribution-synchronization -y

# Setup fluentd
RUN yum install -y curl wget gcc
RUN rpm --import http://packages.treasuredata.com/GPG-KEY-td-agent
ADD td.repo /etc/yum.repos.d/td.repo
RUN yum check-update && yum install -y td-agent

# Setup fluentd-zabbix
RUN /usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-zabbix
RUN rpm -ivh http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm
RUN yum install -y zabbix-agent zabbix-sender

ADD td-agent.conf /etc/td-agent/td-agent.conf
ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE  8888
CMD	["/bin/bash","/run.sh"]
