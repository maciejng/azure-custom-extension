#!/bin/bash

sed -i "s/#ForwardAgent yes/ForwardAgent yes/g" /etc/ssh/sshd_config
service sshd restart