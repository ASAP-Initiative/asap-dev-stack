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
  && pip install --no-cache-dir ansible

# Create non-root user and workspace
RUN useradd -m -s /bin/bash ansible \
  && mkdir -p /ansible \
  && chown -R ansible:ansible /ansible

WORKDIR /ansible
USER ansible

CMD ["tail", "-f", "/dev/null"]
