#!/bin/bash

echo `openssl rand -base64 14`|passwd --stdin root
#echo '/fake /fakedir xfs defaults 0 0'>>/etc/fstab
echo "REBOOTING YOUR SYSTEM"
sleep 3
shutdown -r now

exit 0
