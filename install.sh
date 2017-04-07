#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "DIR=$DIR"

function create_link {
  source="${DIR}/$1"
  target="${HOME}/${1/_/.}"

  printf "linking %s to %s..." $source $target

  if [ -e $target ]; then
    printf "removing already existing %s..." $target
    rm -rf $target
  fi

  ln -sf $source $target
  printf "DONE!\n"
}

for i in _*
do
  create_link $i
done

# Install vim plugins using plug.vim
vim -E -c PlugUpgrade -c PlugClean! -c PlugUpdate -c qa
