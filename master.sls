{% set salt_role = "master" %}

{% include 'logstash/service.jinja' %}

salt-roster-config:
  file.managed:
    - name: /etc/salt/roster
    - source: salt://salt/conf/roster-base
    - require:
      - pip: salt