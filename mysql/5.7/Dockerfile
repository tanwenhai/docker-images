FROM centos 
ENV MYSQL_RPM mysql57.rpm
MAINTAINER tanwenhai tanwenhai@outlook.com
COPY ./$MYSQL_RPM $MYSQL_RPM
COPY docker-entrypoint.sh /entrypoint.sh

RUN rpm -ivh ${MYSQL_RPM} \
	&& yum install -y mysql-server \
	&& yum clean all \
	&& rm -f ${MYSQL_RPM} \
	&& chmod +x /entrypoint.sh 

VOLUME /var/lib/mysql

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld", "--user=mysql"]
