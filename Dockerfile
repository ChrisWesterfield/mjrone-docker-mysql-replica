FROM mysql:8.0.2
COPY replica.sh /docker-entrypoint-initdb.d/
COPY munin.sh /docker-entrypoint-initdb.d/
RUN apt-get update
RUN apt-get install supervisor munin munin-node munin-plugins-extra libdbi-perl libcache-cache-perl python-pip -y
COPY munin-node.conf /etc/munin/munin-node.conf
RUN rm /etc/munin/plugins/df /etc/munin/plugins/df_inode /etc/munin/plugins/diskstats /etc/munin/plugins/exim_mailqueue /etc/munin/plugins/fw_packets /etc/munin/plugins/interrupts /etc/munin/plugins/if* /etc/munin/plugins/irqstats /etc/munin/plugins/munin_stats  /etc/munin/plugins/swap /etc/munin/plugins/users /etc/munin/plugins/vmstat
RUN echo "[mysql_*]" > /etc/munin/plugin-conf.d/mysql
RUN echo "       env.mysqlconnection DBI:mysql:mysql" >> /etc/munin/plugin-conf.d/mysql
RUN echo "       env.mysqluser root" >> /etc/munin/plugin-conf.d/mysql
RUN echo "       env.mysqlpassword 123" >> /etc/munin/plugin-conf.d/mysql
RUN pip install PyMunin
RUN apt-get purge gcc python-pip binutils -y
RUN apt-get autoremove -y
RUN apt-get autoclean
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_bin_relay_log
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_commands
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_connections
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_files_tables
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_bpool
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_bpool_act
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_insert_buf
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_io
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_io_pend
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_log
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_rows
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_semaphores
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_innodb_tnx
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_myisam_indexes
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_network_traffic
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_qcache
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_qcache_mem
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_replication
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_select_types
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_slow
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_sorts
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_table_locks
RUN ln -s /usr/share/munin/plugins/mysql_ /etc/munin/plugins/mysql_tmp_tables
