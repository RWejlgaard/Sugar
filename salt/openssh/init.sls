{% from "openssh/map.jinja" import openssh with context %}

openssh:
    pkg:
        - installed
        - name: openssh-server

sshd_config:
    file.managed:
        - name: "/etc/ssh/sshd_config"
        - source: salt://openssh/files/sshd_config

ssh_config:
    file.managed:
        - name: "/etc/ssh/ssh_config"
        - source: salt://openssh/files/ssh_config

authorized_keys:
    file.managed:
        - name: "{{ pillar['global']['home'] }}/authorized_keys"
        - source: salt://openssh/files/authorized_keys

ssh:
    service.running:
        - reload: True
        - name: ssh
        - require:
        - pkg: openssh-server
