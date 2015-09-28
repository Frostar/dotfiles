# *** JFL ***

# ls
alias ls='ls -Gph'
alias ll='ls -l'
alias la='ll -a'

# launch sublime
alias sublime='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
# launch console matlab
alias matlab='/Applications/MATLAB_R2014b.app/bin/matlab -nodesktop'

# System log
alias systemlog='tail -f /var/log/system.log'

# SSH
alias jflserver='ssh jfl@84.238.29.223'
alias raspi='ssh pi@84.238.29.223 -p 9092'
alias pluto='ssh jens@84.238.29.223 -p 9093'

# fortune from jfl server
alias jfl_exe='jflserver -X '
alias fortune='jfl_exe fortune'


# git branch i parentes
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}


# new prompt
#PS1='\[\033[36;1m\]\u\[\033[m\]@\[\033[37m\]\h:\[\033[32m\]\W\[\033[37m\]$(git_branch)\[\033[m\]\$ '
PS1='\[\033[1;97;46m\]\u\[\033[m\]\[\033[30;46m\] \W$(git_branch)\[\033[m\]\[\033[36m\]\[\033[m\] '
#PS1='\u@\h:\W$(git_branch)\$ '
#PS1='\[\033[36;1m\]\u\[\033[m\]@\[\033[31m\]\h:\[\033[32m\]\W\[\033[34m\]$(git_branch)\[\033[m\]\$ '

# CLI colors
export CLICOLORS=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# For using rm !(file)
shopt -s extglob

# MacPorts Installer addition on 2015-01-20_at_20:50:47: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

