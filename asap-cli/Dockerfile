FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/home/ansible

# Install system deps and latest Ansible from PyPI
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     build-essential gcc libffi-dev libssl-dev \
     libxml2-dev libxslt1-dev openssh-client git ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && python -m pip install --upgrade pip setuptools wheel \
  && pip install --no-cache-dir ansible==9.13

# Create non-root user and workspace
RUN useradd -m -s /bin/bash ansible \
  && mkdir -p /ansible \
  && chown -R ansible:ansible /ansible /home/ansible

# Set up SSH for Ansible user
COPY id_ed25519* /home/ansible/.ssh/
RUN chmod 600 /home/ansible/.ssh/id_ed25519* && \
    chown ansible: /home/ansible/.ssh/id_ed25519*

# Set up default Ansible inventory
COPY asap-dev-inventory.ini /home/ansible
ENV ANSIBLE_INVENTORY=/home/ansible/asap-dev-inventory.ini

CMD ["tail", "-f", "/dev/null"]

ENV ANSIBLE_HOST_KEY_CHECKING=False

USER ansible
WORKDIR /home/ansible
