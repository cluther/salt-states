net-snmp-utils:
  pkg.installed

/etc/snmp/snmp.conf:
  file.managed:
    - source: salt://snmp/snmp.conf
    - require:
      - pkg.installed: net-snmp-utils

net-snmp:
  pkg.installed

/etc/snmp/snmpd.conf:
  file.managed:
    - source: salt://snmp/snmpd.conf
    - require:
      - pkg.installed: net-snmp

snmpd:
  service.running:
    - enabled: True
    - require:
      - file: /etc/snmp/snmpd.conf
    - watch:
      - file: /etc/snmp/snmpd.conf
