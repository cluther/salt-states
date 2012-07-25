base:
  '*':
    {% if grains['kernel'] == 'Linux' %}
    - linux
    {% endif %}

  'zd*':
    - zenoss.zenpackdev
