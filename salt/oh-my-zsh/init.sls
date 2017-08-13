include: 
    - oh-my-zsh.zsh

change_shell:
    module.run:
        - name: user.chshell
        - m_name: {{ grains['username'] }}
        - shell: /usr/bin/zsh

https://github.com/robbyrussell/oh-my-zsh.git:
    git.latest:
        - rev: master
        - target: "{{ pillar['oh-my-zsh']['home'] }}/.oh-my-zsh"
        - unless: "test -d {{ pillar['oh-my-zsh']['home'] }}/.oh-my-zsh"

.zshrc:
    file.managed:
        - name: "{{ pillar['oh-my-zsh']['home'] }}/.zshrc"
        - source: salt://oh-my-zsh/files/.zshrc
        - mode: '0644'
        - template: jinja

af-magic.zsh-theme:
    file.managed:
        - name: "{{ pillar['oh-my-zsh']['home'] }}/.oh-my-zsh/themes/af-magic.zsh-theme"
        - source: salt://oh-my-zsh/files/af-magic.zsh-theme

