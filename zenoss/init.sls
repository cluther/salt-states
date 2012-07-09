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
      - perl-DBI
      - net-snmp
      - net-snmp-utils
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

required_services:
  service.running:
    - enable: True
    - names:
      - rabbitmq-server
      - memcached
      - snmpd
