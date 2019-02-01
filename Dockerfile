FROM mysql:8.0
LABEL maintainer="Chris Westerfield <chris@mjr.one>"
COPY replica.sh /docker-entrypoint-initdb.d/