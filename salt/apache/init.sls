apache2:
    pkg:
        - installed
        - name: apache2

apache2.conf:
    file.managed:
        - name: "{{ pillar['apache']['conf_dir'] }}/apache2.conf"
        - source: salt://apache/conf/apache2.conf
        - template: jinja

{{ pillar['apache']['www_dir'] }}:
    file.recurse:
        - source: salt://apache/www
        - include_empty: True