#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "vim DIR=$DIR"

. ../funcs.sh

create_links "$DIR"

# Install vim plugins using plug.vim
vim -E -c PlugUpgrade -c PlugClean! -c PlugUpdate -c qa
