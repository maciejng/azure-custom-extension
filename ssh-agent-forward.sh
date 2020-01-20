#!/bin/bash

sed -i "s/#AllowAgentForwarding yes/AllowAgentForwarding yes/g" /etc/ssh/sshd_config
service sshd restart
