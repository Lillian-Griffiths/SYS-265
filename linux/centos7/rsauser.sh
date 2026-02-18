#!/bin/bash

USER_NAME="$1"
PUBLIC_KEY_PATH="$2"

sudo useradd -m -d /home/$USER_NAME -s /bin/bash "$USER_NAME"
sudo passwd -l "$USER_NAME"
sudo mkdir -p /home/$USER_NAME/.ssh
sudo cp "$PUBLIC_KEY_PATH" /home/$USER_NAME/.ssh/authorized_keys
sudo chmod 700 /home/$USER_NAME/.ssh
sudo chmod 600 /home/$USER_NAME/.ssh/authorized_keys
sudo chown -R "$USER_NAME:$USER_NAME" /home/$USER_NAME/.ssh
