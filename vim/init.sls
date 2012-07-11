vim-enhanced:
  pkg.installed

/etc/vimrc:
  file.managed:
    - source: salt://vim/vimrc
    - required:
      - pkg.installed: vim-enhanced
