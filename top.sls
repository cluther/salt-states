base:
  '* and G@nodename:zenoss':
    - match: compound
    - zenoss

  '* and G@os_family:RedHat':
    - match: compound
    - yum
