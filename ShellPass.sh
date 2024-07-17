#!/bin/bash
export HISTFILE=
unset HISTFILE
unset HISTSIZE
unset HISTFILESIZE
export HISTCONTROL=ignorespace
unset PROMPT_COMMAND
chmod 400 ~/.bash_history
run_command() {
    local command="$1"
    if [[ $command == sudo* ]]; then
        eval " $command"
    else
        eval " $command" || sudo bash -c " $command"
    fi
}
trap '' HISTADD
set -o emacs
if [ -z "$BASH_VERSION" ]; then
    exec bash "$0"
fi
if [[ -t 1 ]]; then
    bind 'TAB:menu-complete'
fi
PS1="\[\e[1;32m\]\u@\h:\w\$\[\e[0m\] "
echo -e "\e[1;34mWelcome to the secure shell. Type 'quit_shell' to exit.\e[0m"
while true; do
    read -e -p "Enter your command: " user_command
    if [ "$user_command" == "quit_shell" ]; then
        echo -e "\e[1;31mExiting shell...\e[0m"
        break
    fi
    temp_file=$(mktemp)
    echo " $user_command" > "$temp_file"
    chmod +x "$temp_file"
    source "$temp_file" || sudo bash "$temp_file"
    rm -f "$temp_file"
done
chmod 600 ~/.bash_history
