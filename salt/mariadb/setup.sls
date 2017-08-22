sugar_setup.sql:
    file.managed:
        - name: "/usr/share/mysql/sugar_setup.sql"
        - source: salt://mariadb/sql/setup.sql

import_setup:
    cmd.run:
        - name: "mysql -p{{ pillar['mariadb']['server']['root_password'] }} < /usr/share/mysql/sugar_setup.sql"
        - require:
            - file: sugar_setup.sql