/opt/sugar:
  file.directory

/opt/sugar/listener.py:
  file.managed:
    - source: salt://services/files/listener.py
    - required:
      - file: /opt/sugar

restart-listener:
  cmd.run:
    - name: "python /opt/sugar/listener.py restart"
    - required:
      - file: /opt/sugar
      - file: /opt/sugar/listener.py
    - watch:
      - file: /opt/sugar/listener.py