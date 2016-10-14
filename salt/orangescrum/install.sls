include:
  - .apache
git:
  pkg.installed

git.clone:
  module.run:
    - cwd: /var/www/html/test
    - repository: https://github.com/Orangescrum/orangescrum.git
    - require_in:
      - file: /var/www/html/test
    - require:
      - pkg: httpd

/var/www/html/test:
  file.directory:
    - user: apache
    - group: apache
    - recurse:
      - user
      - group

/var/www/html/test/app/tmp:
  file.directory:
    - mode: 777
    - recurse:
      - mode
    - require:
      - file: /var/www/html/test

/var/www/html/test/app/webroot:
  file.directory:
    - mode: 777
    - recurse:
      - mode
    - require:
      - file: /var/www/html/test

/var/www/html/test/app/Config:
  file.directory:
    - mode: 777
    - recurse:
      - mode
    - require:
      - file: /var/www/html/test

setenforce 0:
  cmd.run
