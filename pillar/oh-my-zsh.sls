oh-my-zsh:
    home: {{ salt['user.info'](grains['username']).home }}
    theme: af-magic
    auto-update: false
    disable-untracked-files-dirty: true
    plugins: git
