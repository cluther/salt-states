tmux:
  pkg.installed:
    - repo: epel

/etc/tmux.conf:
  file.managed:
    - source: salt://tmux/tmux.conf
    - mode: 644
