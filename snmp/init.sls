net-snmp-utils:
  pkg.installed

/etc/snmp/snmp.conf:
  file.managed:
    - source: salt://snmp/snmp.conf
    - required:
      - pkg.installed: net-snmp-utils

net-snmp:
  pkg.installed

/etc/snmp/snmpd.conf:
  file.managed:
    - source: salt://snmp/snmpd.conf
    - required:
      - pkg.installed: net-snmp

snmpd:
  service.running:
    - enabled: True
    - watch:
      - file: /etc/snmp/snmpd.conf
