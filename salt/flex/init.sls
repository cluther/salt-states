/opt/flex_sdk_4.1.0.16076_mpl.zip:
  file.managed:
    - source: salt://flex_sdk/flex_sdk_4.1.0.16076_mpl.zip

"unzip flex_sdk_4.1.0.16076_mpl.zip":
  cmd.run:
    - cwd: /opt
    - unless: test -d /opt/flex_sdk_4.1.0.16076_mpl
    - require:
      - file.managed: /opt/flex_sdk_4.1.0.16076_mpl.zip

/opt/flex:
  file.symlink:
    - target: /opt/flex_sdk_4.1.0.16076_mpl
    - require:
      - cmd.run: "unzip flex_sdk_4.1.0.16076_mpl.zip"
