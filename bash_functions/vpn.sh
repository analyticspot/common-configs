#!/bin/bash

vpn() {
   VPC=$1
   echo "Connecting to VPC $VPC"
   bastion_ip=$(aws ec2 describe-instances \
      --filters "Name=tag:Type,Values=Bastion" \
      "Name=instance-state-name,Values=running" \
      "Name=tag:aws:cloudformation:stack-name,Values=$VPC" | \
      jq -r '.Reservations[] | .Instances[] | .PublicIpAddress')
   echo "The bastion's IP address is: $bastion_ip"
   # The 10.224 block is for Instaclustr Cassandra servers.
   sshuttle -r `whoami`@$bastion_ip 10.0.0.0/16 10.1.0.0/16 10.224.0.0/16
}
