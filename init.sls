pip:
  pkg.installed:
    - name: python-pip
{% if grains['os_family'] == 'Debian' %}
debconf-utils:
  pkg.installed:
    - require_in: salt-deps
{% endif %}
salt-deps:
  pkg.installed:
    - pkgs:
      - libssl-dev
      - python-dev
      - python-m2crypto
salt:
  pip.installed:
    - name: salt
    - require:
      - pkg: salt-deps
      - pkg: pip
