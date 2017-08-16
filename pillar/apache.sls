apache:
    conf_dir: /etc/apache2
    www_dir: /var/www
    sites: #FORMAT: [{URL}, {DIR}]
        - ['wejlgaard.com', 'rasmus']
        - ['rasmus.space', 'rasmus']
        - ['ziva.wejlgaard.com', 'rasmus']
        - ['cdn.wejlgaard.com', 'cdn']
        - ['perionapp.com', 'perion']