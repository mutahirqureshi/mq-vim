#!/usr/bin/env bash

set -e

VIM="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "VIM=$VIM"

. $VIM/../funcs.sh

create_links "$VIM"

# Install vim plugins using plug.vim
vim -E -c PlugUpgrade -c PlugClean! -c PlugUpdate -c qa
