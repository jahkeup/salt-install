{% from 'salt/map.jinja' import saltstack with context%}

salt:
  pip:
    - removed

{% for service in ['minion', 'master'] %}
salt-{{service}}-service:
  service.disabled:
    - name: salt-{{service}}
    - require_in:
      - pip: salt

salt-{{service}}-upstart:
  file.absent:
    - name: /etc/init/salt-{{service}}.conf
    - require:
      - pip: salt
salt-{{service}}-init:
  file.absent:
    - name: salt-{{service}}
    - require:
      - file: salt-{{service}}-upstart

{% endfor %} # end service config removal.

{% for kind,dir in saltstack.dirs.items() %}
salt-{{kind}}-dir:
  file.absent:
    - name: {{dir}}
    - require:
      - pip: salt
{% endfor %}