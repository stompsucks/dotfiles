# Automatically generated by zsh setup doodads

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=3
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

autoload -Uz compinit && compinit
autoload -Uz colors && colors
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep nomatch


# Clumsily hacked-together settings that probably don't work

if [ ! $LS_COLORS ] && [ -e ~/.dircolors ] && [ ! type dircolors &> /dev/null ]; then
    eval "$(dircolors ~/.dircolors)"
fi

export GREP_COLOR=auto
export TIME_STYLE=iso
export PROMPT="%K{white} %k %F{white}%n@%M %B%(!.#.>)%f%b "

if [ -d /opt/homebrew ]; then
	export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:$PATH"
fi

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lhF'
alias lla='ll -a'

if [ -d ~/.pyenv ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	eval "$(pyenv init --path)"
	eval "$(pyenv virtualenv-init -)"
fi


# Rigamarole

function parse_git_branch () {
	git branch 2> /dev/null | grep "*" | sed -e 's/^* \(.*\)/ (\1)/'
}

function precmd() {
    export RPROMPT="%~$(parse_git_branch)"
    print -Pn "\e]0;%n@%M\a"
}

function preexec() {
    print -Pn "\e]0;%n@%M > $2\a"
}

function csv() {
	csvtool readable $1 | sort | less -inS
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
