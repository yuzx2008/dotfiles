#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "brew.sh" --exclude "liquidprompt/" --exclude ".vim/UltiSnips"\
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	source ~/.bash_profile;

  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  if [ ! -d $HOME/.vim/UltiSnips ]; then
    ln -s $DOTFILES/.vim/UltiSnips $HOME/.vim/UltiSnips
  fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
