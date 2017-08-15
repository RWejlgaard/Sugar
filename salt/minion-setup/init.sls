minion-setup.py:
    file.managed:
        - name: "{{ pillar['minion-setup']['root-path'] }}/minion-setup.py"
        - source: salt://minion-setup/files/minion-setup.py
        - mode: '0666'
        - template: jinja