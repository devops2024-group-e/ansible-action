FROM amazonlinux:2023

RUN yum update -y & yum install -y yum-utils shadow-utils gcc libffi-devel python3 python3-pip openssh-clients rsync

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN echo "Installing Ansible"; \
    pip3 install --upgrade pip; \
    pip3 install docker; \
    pip3 install ansible


RUN mkdir /ansible
COPY ./requirements.yaml /ansible/requirements.yaml

WORKDIR /ansible

# Install dependencies with specific versions
RUN ansible-galaxy collection install -r requirements.yaml -p ~/collections

RUN cp -r ~/collections/ansible_collections/ ~/.ansible/collections ; rm -rf ~/collections
