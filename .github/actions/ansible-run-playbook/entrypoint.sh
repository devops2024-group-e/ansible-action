#!/bin/bash

# Setup SSH KEY
echo "Setting up SSH key"
mkdir -p ~/.ssh/
echo "$1" > ~/.ssh/do_ssh_key
chmod 600 ~/.ssh/do_ssh_key

export DOCKER_USERNAME="$2"
export DOCKER_PASSWORD="$3"
export DIGITAL_OCEAN_TOKEN="$4"
export DIGITAL_OCEAN_SSH_KEY_NAME="$5"

cd $8

ansible-playbook --private-key ~/.ssh/do_ssh_key -i $6 $7 --extra-vars "dockeruser=${2} dockerpassword=${3}"
