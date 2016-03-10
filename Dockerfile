FROM mariadb:10.0

ADD build.sh /opt/

RUN cd /opt && ./build.sh

ADD initdb /docker-entrypoint-initdb.d/

EXPOSE 30002 3306
