# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=3
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/nick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep nomatch
# End of lines configured by zsh-newuser-install

autoload -Uz colors && colors
export NCURSES_NO_UTF8_ACS=1
export PROMPT="%K{white} %k %F{white}%n@%m %B%(!.#.>)%f%b "
export CLICOLOR=1
if [ ! $LS_COLORS ] && [ -e ~/dotfiles/dircolors ]; then
    eval "$(dircolors ~/dotfiles/dircolors)"
fi

function parse_git_branch () {
	git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

function precmd() {
	export RPROMPT="%~$(parse_git_branch)"
    print -Pn "\e]0;%n@%m\a"
}

function preexec() {
    print -Pn "\e]0;%n@%m > $2\a"
}

function csv() {
	csvtool readable $1 | sort | less -inS
}

function chpwd() {
	if [ ! $VIRTUAL_ENV ] && [ -e ./env/bin/activate ]; then
		source ./env/bin/activate
	fi
	if [ $VIRTUAL_ENV ] && [[ `pwd -P` != `dirname $VIRTUAL_ENV`* ]]; then
		deactivate
	fi
}

alias grep='grep --color=auto'

if [[ `uname` == "Linux" ]] then
    alias ls='ls --color'
fi

alias ll='ls -alF'
alias la='ls -a'

