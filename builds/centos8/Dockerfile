FROM centos:8.2.2004

RUN set -x && \
    useradd -m vuls

RUN set -x && \
    dnf install -y openssh-server openssh-clients iproute elrepo-release && \
    /usr/libexec/openssh/sshd-keygen ecdsa

# for deep scan
RUN set -x && \
    dnf install -y sudo which yum-utils dnf-utils dnf-plugins-core

COPY sudoers-vuls /etc/sudoers.d/sudoers-vuls

RUN set -x && \
    chmod 440 /etc/sudoers.d/sudoers-vuls && \
    rm -rf /run/nologin