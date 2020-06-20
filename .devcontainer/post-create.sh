#!/usr/bin/env bash

sudo DEBIAN_FRONTEND=noninteractive apt-get -yq update
if [ 0 -ne $? ]; then
    echo "apt-get update failed"
    exit 1
fi

sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install git
if [ 0 -ne $? ]; then
    echo "apt-get install git failed"
    exit 2
fi

sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install unzip
if [ 0 -ne $? ]; then
    echo "apt-get install unzip failed"
    exit 2
fi

sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install awscli
if [ 0 -ne $? ]; then
    echo "apt-get install awscli failed"
    exit 2
fi

PACKER_VERSION=1.4.5
echo Download packer version $${PACKER_VERSION}
wget https://releases.hashicorp.com/packer/$${PACKER_VERSION}/packer_$${PACKER_VERSION}_linux_amd64.zip
unzip packer_$${PACKER_VERSION}_linux_amd64.zip
sudo mv packer /usr/local/bin/

TERRAFORM_VERSION=0.12.20
echo Download terraform version $${TERRAFORM_VERSION}
wget https://releases.hashicorp.com/terraform/$${TERRAFORM_VERSION}/terraform_$${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_$${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
