#!/usr/bin/env bash
# 创建 xl2tpd 控制文件
mkdir -p /var/run/xl2tpd
touch /var/run/xl2tpd/l2tp-control

# 启动服务
ipsec restart
service xl2tpd restart

# 开始 IPsec 连接
ipsec up myvpn

# 等待 8 秒
sleep 8

# 开始 L2TP 连接
echo "c myvpn" >/var/run/xl2tpd/l2tp-control
