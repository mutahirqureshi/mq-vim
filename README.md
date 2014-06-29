mq-vim
======

use vim-nox package instead of vim-tiny/vim-basic. It contains python and ruby bindings

### Setup
1. ```ln -s ~/vim/.vimrc ~/.vimrc```
2. ```ln -s ~/vim/.vim .vim```

### for Command-T
```bash
rvm install 1.9.3
rvm use 1.9.3
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
```

### Adding plugins
```bash
git submodule add REPO_URL .vim/bundle/PLUGIN_NAME
```

### Removing plugins
1. Delete the relevant section from the .gitmodules file.
2. Stage the .gitmodules changes ```git add .gitmodules```
3. Delete the relevant section from .git/config.
4. Run ```git rm --cached path_to_submodule``` (no trailing slash).
5. Run ```rm -rf .git/modules/path_to_submodule```
6. Commit ```git commit -m "Remove submodule <name>"```
7. Delete the now untracked submodule files ```rm -rf path_to_submodule```

