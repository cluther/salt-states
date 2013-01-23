### Repository ###############################################################

# Replace this with pkgrepo once it's available.
"/etc/yum.repos.d/zenoss-core.repo":
  file.managed:
    - source: "salt://zenoss/zenoss-core.repo"


### MySQL ####################################################################

"MySQL-server":
  pkg.installed:
    - repo: "zenoss-core"
    - require:
      - file: "/etc/yum.repos.d/zenoss-core.repo"

"mysql":
  service.running:
    - enable: True
    - require:
      - pkg: "MySQL-server"


### RabbitMQ #################################################################

"rabbitmq-server":
  pkg.installed:
    - repo: "zenoss-core"
    - require:
      - file: "/etc/yum.repos.d/zenoss-core.repo"

  service.running:
    - enable: True
    - require:
      - pkg: "rabbitmq-server"


### memcached ################################################################

"memcached":
  pkg:
    - installed

  service.running:
    - enable: True
    - require:
      - pkg: "memcached"


### Zenoss ###################################################################

"zenoss":
  pkg.installed:
    - repo: "zenoss-core"
    - require:
      - file: "/etc/yum.repos.d/zenoss-core.repo"
      - service: "mysql"

  service.running:
    - enable: True
    - require:
      - pkg: "zenoss"
      - file: "/opt/zenoss/var/zenpack_actions.txt"
      - file: "/opt/zenoss/etc/DAEMONS_TXT_ONLY"
      - file: "/opt/zenoss/etc/daemons.txt"

# Prevent ZenPacks from being installed on first startup.
"/opt/zenoss/var/zenpack_actions.txt":
  file.managed:
    - source: "salt://zenoss/zenpack_actions.txt"
    - user: zenoss
    - group: zenoss
    - require:
      - pkg: "zenoss"

# Allow control (in daemons.txt) of which daemons run.
"/opt/zenoss/etc/DAEMONS_TXT_ONLY":
  file.managed:
    - user: zenoss
    - group: zenoss
    - require:
      - pkg: "zenoss"

# Control which daemons will run.
"/opt/zenoss/etc/daemons.txt":
  file.managed:
    - source: "salt://zenoss/daemons.txt"
    - user: zenoss
    - group: zenoss
    - require:
      - pkg: "zenoss"
