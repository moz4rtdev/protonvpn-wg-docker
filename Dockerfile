FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wireguard-tools \
    iproute2 \
    iptables \
    curl \
    resolvconf \
    tinyproxy \
    && apt-get clean

WORKDIR /root
COPY entrypoint.sh /root/entrypoint.sh
COPY tinyproxy.conf /root/tinyproxy.conf
RUN chmod +x /root/entrypoint.sh

ENV CONF=wg0
ENV PORT=3128

ENTRYPOINT ["/root/entrypoint.sh"]

