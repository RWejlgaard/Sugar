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
        - name: "{{ pillar['global']['home'] }}/.ssh/authorized_keys"
        - source: salt://openssh/files/authorized_keys

ssh:
    cmd.run:
        - name: "service ssh restart"
        - require:
            - pkg: openssh-server
            - file: sshd_config
            - file: ssh_config
            - file: authorized_keys
