base:
  '* and G@nodename:zenoss':
    - match: compound
    - zenoss

  '* and G@os_family:RedHat':
    - match: compound
    - yum

  '* and G@nodename:tomcat and G@osfullname:Ubuntu':
    - match: compound
    - tomcat7
