common_packages:
  pkg.installed:
    - names:
      - man
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
