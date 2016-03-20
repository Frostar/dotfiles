# *** JFL ***

# General Unix config files
# ls
alias ls='ls -Gph'
alias ll='ls -l'
alias la='ll -a'

# git branch i parentes
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

## Darwin
# System log
alias systemlog='tail -f /var/log/system.log'

alias raspi='ssh pi@84.238.29.223 -p 9092'
alias lakeside='ssh jfl@www.lakeside.dk'



### JFL Macbook Pro
# link macvim as vim
alias vi='/Applications/MacVim.App/Contents/MacOS/Vim'
alias vim='/Applications/MacVim.App/Contents/MacOS/Vim'
# launch sublime
alias sublime='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
# launch console matlab
alias matlab='/Applications/MATLAB_R2015b.app/bin/matlab -nodesktop'
# SSH
alias jflserver='ssh jfl@84.238.29.223'
# fortune from jfl server
alias fortune='jflserver fortune'
# Prompt
function _update_ps1() {
    PS1="$(~/.bash/powerline-shell/powerline-shell.py --cwd-mode dironly  $? 2> /dev/null)"
}
if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
#PS1='\[\033[1;97;46m\]\u\[\033[m\]\[\033[30;46m\] \W$(git_branch)\[\033[m\]\[\033[36m\]\[\033[m\] '


# new prompt
#PS1='\[\033[36;1m\]\u\[\033[m\]@\[\033[37m\]\h:\[\033[32m\]\W\[\033[37m\]$(git_branch)\[\033[m\]\$ '
#PS1='\u@\h:\W$(git_branch)\$ '
#PS1='\[\033[36;1m\]\u\[\033[m\]@\[\033[31m\]\h:\[\033[32m\]\W\[\033[34m\]$(git_branch)\[\033[m\]\$ '

# CLI colors
export CLICOLORS=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export TERM=xterm-256color

export LC_ALL="en_DK.UTF-8"

# For using rm !(file)
shopt -s extglob

