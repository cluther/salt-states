/etc/selinux/config:
  file.sed:
    - before: (permissive|enforcing)$
    - after: disabled 
    - limit: ^SELINUX=

"setenforce 0":
  cmd.run:
    - onlyif: test $(getenforce) = "Enforcing"
