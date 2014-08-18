"/etc/yum.conf":
  file.managed:
    - source: "salt://yum/yum.conf"
    - mode: 644
