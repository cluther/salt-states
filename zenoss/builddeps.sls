include:
  - zenoss.deps
  - maven
  - flex

centos_packages:
  pkg.installed:
    - names:
      - ccache
      - autoconf
      - swig
      - cairo-devel
      - pango-devel
      - libpng-devel
      - libxml2-devel
      - libxslt-devel
      - openldap-devel

# TODO: Figure out how to get rrdtool and rrdtool-devel from rpmforge.
