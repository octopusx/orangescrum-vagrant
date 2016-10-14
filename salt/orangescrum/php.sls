php:
  pkg.installed

php-mysqlnd:
  pkg.installed

php-packages:
  pkg.installed:
    - pkgs:
      - php-gd
      - php-imap
      - php-ldap
      - php-odbc
      - php-pear
      - php-xml
      - php-xmlrpc
      - php-mbstring
      - php-mcrypt
      - php-mssql
      - php-snmp
      - php-soap
      - php-tidy
      - libcurl
      - libcurl-devel

httpd_service_restart:
  service.running:
    - name: httpd
    - restart: True
    - watch:
      - pkg: php
      - pkg: php-mysqlnd
      - pkg: php-packages
