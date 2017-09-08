webdis:
    pkg.installed

/etc/webdis/webdis.json:
    file.managed:
        - source: salt://redis/files/webdis.json
        - required:
            - pkg: webdis

restart-webdis:
    cmd.run:
        - name: "service webdis restart"
        - watch:
            - file: /etc/webdis/webdis.json

