#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	# 将文件拷贝到 ~ 
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude ".vim/UltiSnips"\
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
 
  # 加入到 .bashrc 中 
  if 
    cat ~/.bashrc | grep "source ~/.bash_profile;" > /dev/null 2>&1
  then
    echo "Found \"source ~/.bash_profile;\" in ~/.bashrc."
  else
    echo "source ~/.bash_profile;" >> ~/.bashrc
  fi

  # 执行 bash_profile
  source ~/.bash_profile;

  # 如果不存在 Vundle，则 clone
  if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
  echo "dotfiles installed completed. Please don't forget to change your git username and email:";
  echo "    git config --global user.name \"Your Name\"";
  echo "    git config --global user.email you@example.com";
  echo "";
  echo "When you first start vim, please use :PluginInstall to install all the plugins.(vim +PluginInstall +qall)"
  echo "Have fun!"
fi;

unset doIt;
