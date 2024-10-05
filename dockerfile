# 基于 Ubuntu 镜像
FROM ubuntu:20.04

# 安装相关软件包
RUN apt-get update && \
    apt-get install -y strongswan iputils-ping curl neovim xl2tpd net-tools && \
    rm -rf /var/lib/apt/lists/*

# 创建用于配置的目录
RUN mkdir -p /etc/xl2tpd

# 将启动脚本复制到容器中
COPY start-vpn.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-vpn.sh

# 设置环境变量
ENV VPN_SERVER_IP=''
ENV VPN_IPSEC_PSK=''
ENV VPN_USER=''
ENV VPN_PASSWORD=''

# 执行启动脚本
CMD ["/usr/local/bin/start-vpn.sh"]
