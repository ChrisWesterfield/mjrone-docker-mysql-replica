FROM mysql:8.0.3
COPY replica.sh /docker-entrypoint-initdb.d/


