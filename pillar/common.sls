oh-my-zsh:
    home: {{ salt['user.info'](grains['username']).home }}
    theme: af-magic
    auto-update: false
    disable-untracked-files-dirty: true
    plugins: git

redis:
  root_dir: /var/lib/redis
  user: redis
  port: 6379
  bind: {{ grains['ipv4'][0] }}
  snapshots:
    - '900 1'
    - '300 10'
    - '60  10000'

  lookup:
    svc_state: running
    cfg_name: /etc/redis.conf
    pkg_name: redis-server
    svc_name: redis-server
    overcommit_memory: True