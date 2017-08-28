install-neovim:
    pkgrepo.managed:
        - ppa: ppa:neovim-ppa/stable
    pkg.installed:
        - name: neovim
        - refresh: True

.config:
    file.directory:
        - name: "{{ pillar['global']['home'] }}/.config"

nvim:
    file.directory:
        - name: "{{ pillar['global']['home'] }}/.config/nvim"

init.vim:
    file.managed:
        - name: "{{ pillar['global']['home'] }}/.config/nvim/init.vim"
        - source: salt://neovim/files/init.vim
        - require:
            - pkg: neovim
            - file: {{ pillar['global']['home'] }}/.config
            - file: {{ pillar['global']['home'] }}/.config/nvim

{{ pillar['global']['home'] }}/.vim:
    file.recurse:
        - source: salt://neovim/files/vim
        - require:
            - pkg: neovim
