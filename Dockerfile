FROM golang:alpine

ENV TERRAFORM_VERSION=0.11.14

RUN apk add --update git bash openssh

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

RUN mkdir -p /usr/local/ignw
WORKDIR /usr/local/ignw
ADD * ./

RUN terraform init
