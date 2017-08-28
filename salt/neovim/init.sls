add

install-neovim:
    pkgrepo.managed:
        - ppa: ppa:neovim-ppa/stable
    pkg.installed:
        - name: neovim
        - refresh: True

init.vim:
    file.managed:
        - name: "{{ pillar['global']['home'] }}/.config/nvim/init.vim"
        - source: salt://neovim/files/init.vim
        - require:
            - pkg: neovim

{{ pillar['global']['home'] }}/.vim:
    file.recurse:
        - source: salt://neovim/files/vim
        - require:
            - pkg: neovim
