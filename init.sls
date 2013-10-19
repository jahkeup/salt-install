pip:
  pkg.installed:
    - name: python-pip

salt:
  pip.installed:
    - name: salt
    - require:
      - pkg: pip
