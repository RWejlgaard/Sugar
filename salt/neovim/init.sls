neovim:
    pkg.installed:
        - fromrepo: "ppa:neovim-ppa/stable"

init.vim:
    file.managed:
        - name: "{{ pillar['global']['home'] }}/.config/nvim/init.vim"
        - source: salt://neovim/files/init.vim

{{ pillar['global']['home'] }}/.vim:
    file.recurse:
        - source: salt://neovim/files/vim
