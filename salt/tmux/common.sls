include:
    - tmux.tmux

.tmux.conf:
    file.managed:
        - name: "{{ pillar['global']['home'] }}/.tmux.conf"
        - source: salt://tmux/files/.tmux.conf
        - mode: '0644'
        - template: jinja

https://github.com/tmux-plugins/tpm.git:
    git.latest:
        - rev: master
        - target: "{{ pillar['global']['home'] }}/.tmux/plugins/tpm"