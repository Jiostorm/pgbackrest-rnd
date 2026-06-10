FROM postgres:17.3-bookworm

RUN apt update -y && \
  apt upgrade -y && \
  apt install -y --no-install-recommends \
  openssh-server \
  vim \
  iproute2 \
  dnsutils \
  curl \
  pgbackrest

RUN rm -rf /var/lib/apt/lists/* && mkdir -p /var/run/sshd

RUN mkdir -p /tmp/pgbackrest && chown postgres:postgres /tmp/pgbackrest

CMD [ "sh", "-c", "/usr/sbin/sshd -D & sleep 1 && su -c postgres postgres" ]
