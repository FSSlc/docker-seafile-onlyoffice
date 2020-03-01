FROM fsslc/pro-base:18.04
WORKDIR /opt/seafile

ENV SEAFILE_VERSION=6.3.13 SEAFILE_SERVER=seafile-pro-server

RUN mkdir -p /etc/my_init.d

RUN mkdir -p /opt/seafile/

RUN curl -sSL -G -d "p=/pro/seafile-pro-server_${SEAFILE_VERSION}_x86-64_Ubuntu.tar.gz&dl=1"        \
    https://download.seafile.com/d/6e5297246c/files/ | tar xzf - -C /opt/seafile/                   \
    && cd /opt/seafile/seafile-pro-server-${SEAFILE_VERSION}                                        \
    && printf '\xFF\xFF\xFF' | dd of=seafile/bin/ccnet-server bs=1 seek=150521 count=3 conv=notrunc \
    && sed -i '54s/3/0xffffff/' seahub/seahub/utils/licenseparse.py

ADD scripts/create_data_links.sh /etc/my_init.d/01_create_data_links.sh

COPY scripts /scripts
COPY templates /templates

EXPOSE 80

CMD ["/sbin/my_init", "--", "/scripts/start.py"]
