/etc/crontab:
    file.managed:
        - source: salt://cron/files/crontab