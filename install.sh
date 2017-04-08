#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "DIR=$DIR"

function create_link {
  source="$1"
  target="$2"

  printf "linking %s to %s..." $source $target

  if [ -e $target ]; then
    printf "moving already existing %s to %s.bak..." $target $target
    mv "$target" "${target}.bak"
  fi

  ln -sf $source $target
  printf "DONE!\n"
}

for i in "${DIR}"/_*
do
  base=$(basename "$i")
  create_link "$i" "${HOME}/${base/_/.}"
done

# Install vim plugins using plug.vim
vim -E -c PlugUpgrade -c PlugClean! -c PlugUpdate -c qa
