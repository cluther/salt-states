include:
  - sudo

/etc/sudoers:
  file.append:
    - text: "%wheel ALL=(ALL) NOPASSWD: ALL"
    - required:
      - pkg.installed: sudo
