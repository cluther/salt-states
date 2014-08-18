tmux-install:
  pkg.installed:
    - name: tmux

tmux-config:
  file.managed:
    - name: /etc/tmux.conf
    - source: salt://tmux/tmux.conf
    - mode: 644
