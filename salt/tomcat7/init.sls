tomcat7:
  file:
    - managed
    - name: /etc/default/tomcat7
    - source: "salt://tomcat7/tomcat7.default"

  pkg:
    - installed
    - require:
      - file: tomcat7

  service:
    - running
    - enable: True
    - require:
      - pkg: tomcat7
    - watch:
      - file: tomcat7

