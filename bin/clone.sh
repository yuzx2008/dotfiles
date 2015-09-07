#!/bin/sh

# git repo dir
dir_name=/media/yuzx/Kingston16/gits
# clone dir
dest_dir=/home/yuzx/data/git_m

# 创建目的 dir
mkdir -p $dest_dir

# ls $1
for filename in `echo ${dir_name}; ls ${dir_name}`
  do
    if [ -d $dir_name'/'$filename ] ; then
      #echo $1'/'$filename
      #scandir $1'/'$filename
      echo $filename
      cd $dest_dir
      git clone file:///media/yuzx/Kingston16/gits/$filename
    #else
      #echo $filename
    fi
  done    

