include:
  - sudo

/etc/sudoers:
  file.append:
    - text: "%wheel ALL=(ALL) NOPASSWD: ALL"
    - require:
      - pkg.installed: sudo
