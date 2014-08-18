include:
  - mysql
  - java
  - snmp

"rpm -ivh http://deps.zenoss.com/yum/zenossdeps.el5.noarch.rpm":
  cmd.run:
    - unless: rpm -q zenossdeps.el5

centos_packages:
  pkg.installed:
    - names:
      - which
      - perl-DBI
      - gmp
      - libgomp
      - libgcj
      - libxslt
      - liberation-fonts

zenoss_packages:
  pkg.installed:
    - repo: zenossdeps-repo
    - names:
      - libevent
      - tk
      - unixODBC
      - erlang
      - rabbitmq-server
      - memcached
    - require:
      - cmd.run: "rpm -ivh http://deps.zenoss.com/yum/zenossdeps.el5.noarch.rpm"

rabbitmq-server:
  service.running:
    - enable: True
    - require:
      - pkg.installed: rabbitmq-server

memcached:
  service.running:
    - enable: True
    - require:
      - pkg.installed: memcached
