mysql-server:
  pkg:
    - installed
    - pkgs:
      - community-mysql-server
      - python2-mysql
  service:
    - running
    - name: mysqld
    - enable: True
    - reload: True
    - watch:
      - file: /etc/my.cnf
    - require:
      - pkg: mysql-server

root:
  mysql_user.present:
    - allow_passwordless: True
    - require:
      - pkg: mysql-server
      - service: mysql-server

orangescrum:
  mysql_user.present:
    - password: orangescrum
    - require:
      - pkg: mysql-server
      - service: mysql-server

orangescrum_database:
  mysql_database.present:
    - name: orangescrum
    - character_set: utf8
    - collate: utf8_unicode_ci

orangescrum_database_grant:
   mysql_grants.present:
    - grant: all privileges
    - database: orangescrum.*
    - user: orangescrum
    - host: localhost

/etc/my.cnf:
  file.managed:
    - source: salt://orangescrum/files/my.cnf

insert_data:
  cmd.run:
    - name: mysql -u root orangescrum < /var/www/html/test/database.sql
  require:
    - file: /etc/my.cnf
    - mysql_database: orangescrum_database
    - mysql_user: root
    - mysql_user: orangescrum
    - mysql_grants: orangescrum_database_grant
