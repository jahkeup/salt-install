pip:
  pkg.installed:
    - name: python-pip
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
