/opt/apache-maven-3.0.4-bin.tar.gz:
  file.managed:
    - source: salt://maven/apache-maven-3.0.4-bin.tar.gz
    - source_hash: md5=e513740978238cb9e4d482103751f6b7

"tar xf apache-maven-3.0.4-bin.tar.gz":
  cmd.run:
    - cwd: /opt
    - unless: test -d /opt/apache-maven-3.0.4
    - require:
      - file.managed: /opt/apache-maven-3.0.4-bin.tar.gz

/opt/maven:
  file.symlink:
    - target: /opt/apache-maven-3.0.4
    - require:
      - cmd.run: "tar xf apache-maven-3.0.4-bin.tar.gz"
