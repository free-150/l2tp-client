### 下载构建文件
```shell
git clone https://github.com/free-150/l2tp-client.git
```

### 构建镜像
```shell
docker build -t vpn-client .
```


### 运行容器

```shell
docker run -d --name vpn-client \
    --restart unless-stopped \
    -e VPN_SERVER_IP='你的VPN服务器IP' \
    -e VPN_IPSEC_PSK='你的IPsec预共享密钥' \
    -e VPN_USER='你的VPN用户名' \
    -e VPN_PASSWORD='你的VPN密码' \
    --privileged vpn-client
```

### 静态路由
进入容器中添加

```shell
route add -net 10.1.0.0 netmask 255.255.255.0 dev ppp0
```

### 参考
> https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients-zh.md
