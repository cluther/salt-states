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

/root/zenoss-4.1.1-1396.el5.x86_64.rpm:
  file.managed:
    - source: salt://zenoss/zenoss-4.1.1-1396.el5.x86_64.rpm

/root/zenoss-core-zenpacks-4.1.1-1396.el5.x86_64.rpm:
  file.managed:
    - source: salt://zenoss/zenoss-core-zenpacks-4.1.1-1396.el5.x86_64.rpm

/root/zenoss-enterprise-zenpacks-4.1.1-1396.el5.x86_64.rpm:
  file.managed:
    - source: salt://zenoss/zenoss-enterprise-zenpacks-4.1.1-1396.el5.x86_64.rpm

"rpm --nodeps -ivh /root/zenoss-4.1.1-1396.el5.x86_64.rpm":
  cmd.run:
    - unless: rpm -q zenoss
    - require:
      - file.managed: /root/zenoss-4.1.1-1396.el5.x86_64.rpm

zenoss:
  service.running:
    - enable: True
    - require:
      - cmd.run: rpm --nodeps -ivh /root/zenoss-4.1.1-1396.el5.x86_64.rpm
