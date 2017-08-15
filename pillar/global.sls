global:
    home: {{ salt['user.info'](grains['username']).home }}