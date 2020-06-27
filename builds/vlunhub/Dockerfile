FROM debian:8
# jessie 20150425

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x && \
    useradd -m vuls

RUN set -x && \
    apt-get update && \
    apt-get install -y \
    aptitude \
    autoconf \
    bison \
    build-essential \
    debian-goodies \
    iproute2 \
    iputils-ping \
    locales \
    openssh-server \
    sudo \
    wget && \
    mkdir /var/run/sshd

    # Heartbleed(CVE-2014-0160), CCS Injection(CVE-2014-0224)
RUN wget http://snapshot.debian.org/archive/debian/20130319T033933Z/pool/main/o/openssl/openssl_1.0.1e-2_amd64.deb -O /tmp/openssl_1.0.1e-2_amd64.deb && \
    dpkg -i /tmp/openssl_1.0.1e-2_amd64.deb && \
    wget http://snapshot.debian.org/archive/debian/20130319T033933Z/pool/main/o/openssl/libssl1.0.0_1.0.1e-2_amd64.deb -O /tmp/libssl1.0.0_1.0.1e-2_amd64.deb && \
    dpkg -i /tmp/libssl1.0.0_1.0.1e-2_amd64.deb && \
    # ShellShock(CVE-2014-6271)
    wget http://snapshot.debian.org/archive/debian/20130101T091755Z/pool/main/b/bash/bash_4.2%2Bdfsg-0.1_amd64.deb -O /tmp/bash_4.2+dfsg-0.1_amd64.deb && \
    dpkg -i /tmp/bash_4.2+dfsg-0.1_amd64.deb && \
    # VENOM(CVE-2015-3456)
    apt-get install -y \
    libgsoap5 \
    libpng12-0 \
    libpython2.7 \
    libsdl1.2debian \
    libvncserver0 \
    libvpx1 \
    libxcursor1 \
    libxml2 \
    libxmu6 \
    libxt6 && \
    wget https://snapshot.debian.org/archive/debian/20150315T152429Z/pool/contrib/v/virtualbox/virtualbox_4.3.18-dfsg-3_amd64.deb -O /tmp/virtualbox_4.3.18-dfsg-3_amd64.deb && \
    dpkg -i /tmp/virtualbox_4.3.18-dfsg-3_amd64.deb

COPY sudoers-vuls /etc/sudoers.d/sudoers-vuls

RUN set -x && \
    chmod 440 /etc/sudoers.d/sudoers-vuls && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*