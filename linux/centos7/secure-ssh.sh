#!/bin/bash

# author: lillian griffiths
# creates a new ssh user using $1 parameter
# adds a public key from the local repo or curled from the remote repo
# removes root ability to ssh

USERNAME=$1

useradd -m -s /bin/bash "$USERNAME"
passwd -l "$USERNAME"

mkdir -p /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh

if [ -f "../public-keys/id_rsa.pub" ]; then
    cp ../public-keys/id_rsa.pub /home/$USERNAME/.ssh/authorized_keys
else
    curl -s https://github.com/Lillian-Griffiths/SYS-265/linux/public-keys/id_rsa.pub \
        -o /home/$USERNAME/.ssh/authorized_keys
fi

chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd
