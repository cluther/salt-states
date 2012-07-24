base:
  '*':
    {% if grains['os'] == 'Linux' %}
    - linux
    {% endif %}

  'zd*':
    - zenoss.zenpackdev
