alias ls='ls --color=auto'

bindkey -M vicmd 'K' run-help

#so we can use ^S and ^Q in rtorrent andn the like
stty stop undef
stty start undef

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/simon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# For fancy prompt
autoload -U promptinit
promptinit

autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt prompt_subst
 
# prompt
prompt_color="cyan"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
#   
# show git branch/tag, or name-rev if on detached head
 parse_git_branch() {
	 (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
 }
     
# show red star if there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
   echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
   fi
}
           
# if in a git repo, show dirty indicator + git branch
git_custom_status() {
 local git_where="$(parse_git_branch)"
   [ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# show current rbenv version if different from rbenv global
rbenv_version_status() {
	local ver=$(rbenv version-name)
	[ "$(rbenv global)" != "$ver" ] && echo "[$ver]"
}

PROMPT="%{$fg[$prompt_color]%}%d %{$reset_color%}"

#for indicating if normal and showing git status
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	# put fancy stuff on the right
	if which rbenv &> /dev/null; then
		RPS1='${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status)%{$fg[red]%}$(rbenv_version_status)%{$reset_color%} $EPS1'
	else
		RPS1='${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1'
	fi
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1

play() {
  playlist=$1
  if [ -z $playlist ]
  then
    playlist="playlist"
  fi
  mpv --save-position-on-quit --playlist $playlist

}
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
