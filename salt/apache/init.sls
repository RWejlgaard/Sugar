apache2:
    pkg:
        - installed
        - name: apache2


{{ pillar['apache']['conf_dir'] }}/apache2.conf:
    apache.configfile:
        - config:
            {% for site in pillar['apache']['sites'] %}
            - VirtualHost:
                this: '*:80'
                ServerName:
                    - {{ site[0] }}
                ServerAlias:
                    - www.{{ site[0] }}
                    - {{ site[0] }}
                DocumentRoot: /var/www/vhosts/{{ site[1] }}
                Directory:
                    this: /var/www/{{ site[1] }}
                    Allow from: all
                    Options:
                      - Indexes
                      - FollowSymlinks
                    AllowOverride: All
            {% endfor %}