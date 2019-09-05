#!/usr/bin/env bash
source_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
dest_dir=~
# ignore_list=(".git" ".gitignore" ".DS_Store")
file_list=("zsh_aliases" "zshrc" "zsh_plugins.txt")

usage_exit() {
        echo "Usage: $( basename $0) [-h] [-f]" 1>&2
        echo
        echo "Options:"
        echo "  -h  show this help"
        echo "  -f  do not prompt before creating links in ${dest_dir}"
        exit 1
}


make_link_forcibly() {
    for file in ${file_list}
    do
        src="${source_dir}/${file}"
        dest="${dest_dir}/.${file}"
        if [ -e ${dest} ]; then
            ln -sfn ${src} ${dest}
        else
            ln -sf ${src} ${dest}
        fi
        echo File symbolic link created: ${dest}
    done
}

flag_force=false
while getopts :hf OPT
do
    case $OPT in
        h)  usage_exit
            ;;
        f)  flag_force=true
            ;;
        \?) usage_exit
            ;;
    esac
done

if $flag_force; then
    make_link_forcibly
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
else
    make_link_safely
fi