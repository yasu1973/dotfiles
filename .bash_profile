export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# for Japanese
#export LANG=ja_JP.UTF-8

# read .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

eval $(gdircolors ~/.dircolors-solarized)

# use gls
alias ls='gls --color=auto -FG'

