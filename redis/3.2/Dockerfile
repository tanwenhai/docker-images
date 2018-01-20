FROM centos
MAINTAINER tanwenhai tanwenhai@outlook.com
ENV VER 3.2.11
ENV TARBALL http://download.redis.io/releases/redis-$VER.tar.gz

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo && \
    yum -y install gcc make && \
    curl -L $TARBALL | tar zxv && \
    cd redis-$VER && \
    make && \
    make install && \
    echo "===> Clean up..." && \
    yum clean all && \
    yum remove -y gcc make
COPY redis.conf /redis-$VER
EXPOSE 6379:6379

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server"]
