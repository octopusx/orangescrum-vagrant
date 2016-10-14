httpd:
  pkg:
    - installed
  service.enabled:
    - running:
      - watch:
        - cmd: chkconfig

chkconfig:
  cmd.run:
    - name: chkconfig --levels 235 httpd on
  require:
    - pkg: httpd

/etc/httpd/conf/httpd.conf:
  file.managed:
    - source:
      - salt://orangescrum/files/httpd.conf

/etc/php.ini:
  file.managed:
    - source:
      - salt://orangescrum/files/php.ini

/etc/httpd/conf.d/welcome.conf:
  file.managed:
    - source:
      - salt://orangescrum/files/welcome.conf
