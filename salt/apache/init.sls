apache2:
    pkg:
        - installed
        - name: apache2

apache2.conf:
    file.managed:
        - name: "{{ pillar['apache']['conf_dir'] }}/apache2.conf"
        - source: salt://apache/conf/apache2.conf
        - template: jinja