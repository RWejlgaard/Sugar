mariadb:
  version: 'latest'
  repo_version: '10.1'
  server:
    root_password: password
    config:
      mysqld:
        bind-address: 0.0.0.0