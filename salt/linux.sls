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
      - subversion

include:
  - selinux.disabled
  - iptables.disabled
  - sudo.wheel_nopasswd
  - tmux
  - snmp
  - vim
