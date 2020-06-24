FROM debian:9

RUN set -x && \
    useradd -m vuls

RUN set -x && \
    apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# for deep scan
RUN set -x && \
    apt-get update && \
    apt-get install -y sudo locales aptitude reboot-notifier debian-goodies

COPY sudoers-vuls /etc/sudoers.d/sudoers-vuls

RUN set -x && \
    chmod 440 /etc/sudoers.d/sudoers-vuls