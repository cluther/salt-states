tomcat7:
  pkg:
    - installed

  service:
    - running
    - enable: True
    - require:
      - pkg: "tomcat7"
    - watch:
      - file: "/etc/default/tomcat7"

"/etc/default/tomcat7":
  file:
    - managed
    - source: "salt://tomcat7/tomcat7.default"
    - require:
      - pkg: "tomcat7"
