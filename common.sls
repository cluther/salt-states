common_packages:
  pkg.installed:
    - names:
      - man
      - which
      - telnet
      - wget 
      - mosh
      - tree
      - git

include:
  - selinux.disabled
  - sudo.wheel_nopasswd
  - tmux
  - snmp
