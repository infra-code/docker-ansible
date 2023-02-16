# --------------------------------------------------------------------------------------------------
# Builder Image
# --------------------------------------------------------------------------------------------------
FROM ubuntu

ENV ANSIBLE_VERSION "5.1.0"
ENV ANSIBLE_LINT_VERSION "5.3.2"
ENV YAML_LINT_VERSION "1.26.3"
ENV MOLECULE_VERSION "3.5.2"
ENV MOLECULE_DOCKER_VERSION "1.1.0"
ENV DOCKER_VERSION "5.0.3"
ENV AWSCLI_VERSION "2.2.0"

RUN apt update -y && apt install -y \
        sudo \
        python3\
        python3-pip \
        openssl \
        curl \
        ca-certificates \
        sshpass \
        openssh-client \
        gnupg \
        lsb-release \
        make \
        git \
        python3-dev \
        libffi-dev \
        musl-dev \
        gcc \
        cargo

RUN curl -fsSL https://get.docker.com/ | sh

RUN pip3 install --upgrade pip wheel && \
    pip3 install --upgrade cryptography cffi && \

    pip3 install awscliv2==${AWSCLI_VERSION} \
                 ansible==${ANSIBLE_VERSION} \
                 ansible-lint==${ANSIBLE_LINT_VERSION} \
	             yamllint==${YAML_LINT_VERSION} \
                 molecule==${MOLECULE_VERSION} \
                 molecule-docker==${MOLECULE_DOCKER_VERSION} \
                 docker==${DOCKER_VERSION} 