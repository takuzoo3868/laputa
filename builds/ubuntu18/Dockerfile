FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x && \
    useradd -m vuls

RUN set -x && \
    apt-get update && \
    apt-get install -y openssh-server iproute2 iputils-ping && \
    mkdir /var/run/sshd

RUN set -x && \
    apt-get update && \
    apt-get install -y sudo locales aptitude reboot-notifier debian-goodies

COPY sudoers-vuls /etc/sudoers.d/sudoers-vuls

RUN set -x && \
    chmod 440 /etc/sudoers.d/sudoers-vuls