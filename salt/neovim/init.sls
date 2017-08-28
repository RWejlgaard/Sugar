install-neovim:
    pkgrepo.managed:
        - ppa: neovim-ppa/stable
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

#vundle:
#    git.latest:
#        - name: https://github.com/VundleVim/Vundle.vim.git
#        - target: {{ pillar['global']['home'] }}}/.vim/bundle/Vundle.vim
