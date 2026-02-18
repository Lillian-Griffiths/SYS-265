#!/bin/bash

USERNAME=$1

useradd -m -d /home/$USERNAME -s /bin/bash $USERNAME

mkdir /home/$USERNAME/.ssh

cp SYS265/linux/public-keys/id_rsa.pub /home/$USERNAME/.ssh/authorized_keys

chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
