FROM centos
MAINTAINER tanwenhai tanwenhai@outlook.com
ENV VER 3.2.11
ENV TARBALL http://download.redis.io/releases/redis-$VER.tar.gz

COPY docker-entrypoint.sh /entrypoint.sh

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    yum -y install gcc make && \
    curl -L $TARBALL | tar zxv && \
    cd redis-$VER && \
    make && \
    make install && \
    echo "===> Clean up..." && \
    yum clean all && \
    yum remove -y gcc make && \
    chmod +x /entrypoint.sh

COPY redis.conf /redis.conf
EXPOSE 6379:6379

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server", "/redis.conf"]
