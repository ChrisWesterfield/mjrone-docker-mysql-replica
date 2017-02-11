FROM mysql:5.7
MAINTAINER Christopher Westerfield <chris@mjr.one>
COPY replica.sh /docker-entrypoint-initdb.d/

