base:
  '*':
    {% if grains['kernel'] == 'Linux' %}
    - linux
    {% endif %}

  'zd1-cluther.novalocal':
    - zenoss.builddeps
