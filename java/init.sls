/root/jdk-6u32-linux-amd64.rpm:
  file.managed:
    - source: salt://java/jdk-6u32-linux-amd64.rpm

"rpm -ivh /root/jdk-6u32-linux-amd64.rpm":
  cmd.run:
    - unless: rpm -q jdk
    - require:
      - file.managed: /root/jdk-6u32-linux-amd64.rpm
