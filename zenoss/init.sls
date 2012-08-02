include:
  - zenoss.deps

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
