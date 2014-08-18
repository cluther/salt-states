/root/mysql_rpms:
  file.recurse:
    - source: salt://mysql/rpms

mysqlclient15:
  pkg.purged

libaio:
  pkg.installed

"rpm -ivh /root/mysql_rpms/*.rpm":
  cmd.run:
    - unless: rpm -q MySQL-shared MySQL-client MySQL-server
    - require:
      - file.directory: /root/mysql_rpms
      - pkg.purged: mysqlclient15
      - pkg.installed: libaio

mysql:
  service.running:
    - enable: True
    - require:
      - cmd.run: "rpm -ivh /root/mysql_rpms/*.rpm"
