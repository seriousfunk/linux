#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Script origin: https://github.com/michaeljsmalley/dotfiles
# Updated: https://github.com/seriousfunk/dotfiles
############################

########## Variables

dir=~/dotfiles                                # dotfiles directory
olddir=~/dotfiles_old                         # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="bashrc vimrc vim gitconfig gitignore dockerignore"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo -e "\e[0;33mPausing 5 seconds for message:\e[m"
echo -e "--------------------------------------------"
echo -e "\e[0;33m Update ~/.gitconfig with your credentials. \e[m"
echo -e "--------------------------------------------"
sleep 5
