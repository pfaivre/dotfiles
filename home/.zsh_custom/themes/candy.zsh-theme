#!/usr/bin/env zsh

# Candy
# Oh-my-zsh theme inspired by Pure (https://github.com/hamvocke/dotfiles)
# By Pierre Faivre

if tty | fgrep pts > /dev/null; then
    # If on PTS, prints a pretty "❯" unicode char
    local ret_status="%(?:%F{magenta}:%{$fg_bold[red]%})❯"
else
    # If on a TTY, prints the plain old ">" ASCII
    local ret_status="%(?:%{$fg_bold[magenta]%}:%{$fg_bold[red]%})>"
fi

display_prompt() {
    if [ "`pwd`" = "$HOME" ]; then
        echo "${ret_status}%f"
    else
        echo "\n%F{blue}%~%f $(git_prompt_status)$(git_prompt_info)\n${ret_status}%f"
    fi
}

PROMPT='`display_prompt` '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}"
