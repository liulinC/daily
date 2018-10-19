# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH="$HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
eval `dircolors`
declare PROMPT_COMMAND="history -a;history -r"

if [[ "xterm screen rxvt cygwin" == *"$TERM"* ]] ; then
    bind '"\e[B": history-search-forward'
    bind '"\e[A": history-search-backward'
    set show-all-if-ambiguous on
    set completion-ignore-case on
    if [ -f ~/.git-prompt.sh ]; then
        #wget --no-check-certificate -O ~/.git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
        source ~/.git-prompt.sh
        export PS1='\[\e]0;\h:\w\a\]\n\[\e[01;32m\]\u@\h\[\e[00;33m\] \w$(__git_ps1 " (%s)")\n\[\e[1;$((31+3*!$?))m\]\$\[\e[00m\] '
    else
        export PS1='\[\e]0;\h:\w\a\]\n\[\e[01;32m\]\u@\h\[\e[00;33m\] \w\n\[\e[1;$((31+3*!$?))m\]\$\[\e[00m\] '
    fi
fi

mkdir -p ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

eval `opam config env`
