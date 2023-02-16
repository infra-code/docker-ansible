# --------------------------------------------------------------------------------------------------
# Builder Image
# --------------------------------------------------------------------------------------------------
FROM alpine:3.16

ENV ANSIBLE_VERSION "5.1.0"
ENV ANSIBLE_LINT_VERSION "5.3.2"
ENV YAML_LINT_VERSION "1.26.3"
ENV MOLECULE_VERSION "3.5.2"
ENV MOLECULE_DOCKER_VERSION "1.1.0"
ENV DOCKER_VERSION "5.0.3"
ENV AWSCLI_VERSION "2.2.0"

RUN apk --no-cache add \
        sudo \
        python3\
        py3-pip \
        openssl \
        ca-certificates \
        sshpass \
        openssh-client \
        rsync \
        git && \
    apk --no-cache add --virtual build-dependencies \
        python3-dev \
        libffi-dev \
        musl-dev \
        gcc \
        cargo \
        openssl-dev \
        libressl-dev \
        build-base \
        docker && \
    pip3 install --upgrade pip wheel && \
    pip3 install --upgrade cryptography cffi && \
    pip3 install awscliv2==${AWSCLI_VERSION} ansible==${ANSIBLE_VERSION} ansible-lint==${ANSIBLE_LINT_VERSION} && \
	pip3 install yamllint==${YAML_LINT_VERSION} molecule==${MOLECULE_VERSION} molecule-docker==${MOLECULE_DOCKER_VERSION} docker==${DOCKER_VERSION} && \
    pip3 install mitogen jmespath && \
    pip3 install --upgrade pywinrm && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cache/pip && \
    rm -rf /root/.cargo
