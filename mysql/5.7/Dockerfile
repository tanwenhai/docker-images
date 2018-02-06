FROM centos 
ENV MYSQL_RPM mysql57.rpm

LABEL maintainer="tanwenhai@outlook.com"

COPY ./$MYSQL_RPM $MYSQL_RPM
COPY docker-entrypoint.sh /entrypoint.sh

RUN wget -O ${MYSQL_RPM} https://github.com/tanwenhai/docker-images/raw/master/mysql/5.7/mysql57.rpm \
    && wget -O entrypoint.sh https://raw.githubusercontent.com/tanwenhai/docker-images/master/mysql/5.7/docker-entrypoint.sh \
    && rpm -iUvh ${MYSQL_RPM} \
	&& yum install -y mysql-server \
	&& yum clean all \
	&& rm -f ${MYSQL_RPM} \
	&& chmod +x /entrypoint.sh \
	&& mkdir -p /var/lib/mysql \
	&& chown -R mysql:mysql /var/lib/mysql

VOLUME /var/lib/mysql

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld", "--user=mysql"]
