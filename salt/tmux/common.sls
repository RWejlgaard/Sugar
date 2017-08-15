include:
    - tmux.tmux

.tmux.conf:
    - file.managed:
        - name: "{{ pillar['global']['home'] }}/.tmux.conf"
        - source: salt://tmux/files/.tmux.conf
        - mode: '0644'
        - template: jinja