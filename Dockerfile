FROM centos:8
MAINTAINER rafit.cn

COPY entrypoint.sh /entrypoint.sh

RUN rm -f /etc/init.d \
    && mkdir -p /www/init.d \
    && ln -s /www/init.d /etc/init.d \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos8_base.repo \
    && yum clean all && yum makecache \
    && yum install -y wget openssh-server \
    && wget -O /tmp/install.sh http://download.bt.cn/install/install_6.0.sh \
    && echo y | bash /tmp/install.sh \
    && echo username | bt 6 \
    && echo password | bt 5 \
    && echo "password" > /www/server/panel/default.pl \
    && echo "/auth" > /www/server/panel/data/admin_path.pl \
    && rm -f /www/server/panel/data/ssl.pl \
    && rm -f /www/server/panel/data/bind.pl \
    && echo '["linuxsys", "webssh"]' > /www/server/panel/config/index.json \
    && bt restart \
    && yum clean all \
    && chmod +x /entrypoint.sh

WORKDIR /www/wwwroot

ENTRYPOINT /entrypoint.sh