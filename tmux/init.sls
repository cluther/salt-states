tmux:
  pkg.installed

/etc/tmux.conf:
  file.managed:
    - source: salt://tmux/tmux.conf
