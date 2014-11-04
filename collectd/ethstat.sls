{% from "collectd/map.jinja" import collectd with context %}

include:
  - collectd

{{ collectd.plugindirconfig }}/ethstat.conf:
  file.managed:
    - source: salt://collectd/files/ethstat.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - watch_in:
      - service: collectd-service
    - defaults:
        interface: {{ salt['pillar.get']('collectd:plugins:ethstat:interface', 'eth0') }}

