# Add user's bin folder to the PATH
export PATH=$HOME/.local/bin/:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh_custom

# Name of the theme to load.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="candy"

# Additional plugins to load (can be found in ~/.oh-my-zsh/plugins/*).
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found sudo colored-man-pages fzf)

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Don't ask for permission when oh-my-zsh wants to upgrade.
export DISABLE_UPDATE_PROMPT=true

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load vcs_info function to show git branch name in the prompt (if displayed in the theme)
autoload -Uz vcs_info
precmd() { vcs_info }

# You may need to manually set your language environment
#export LANG=fr_FR.UTF-8
#export LC_ALL=fr_FR.UTF-8


# ------------------------------
#  Key bindings
# ------------------------------

# Cheat sheet:
#   Ctrl+R         Search in history
#   Alt+C          Choose a folder to cd in
#   Ctrl+Backspace delete last word
#   Ctrl+Del       delete next word
#   Esc            Clear the current line

# Ctrl+Backspace to delete last word
bindkey '^H' backward-kill-word

# Ctrl+Del to delete next word
bindkey '^[[3;5~' kill-word

# Remove Esc,Esc binding (usually set to sudo-command-line)
bindkey -r "\e\e"

# Esc clears the current line
bindkey "\e" kill-whole-line


# ------------------------------
#  Aliases
# ------------------------------

alias pwgen="pwgen -c -n -y -s 16"

alias u="~/.local/bin/update-system.sh"

alias fastfetch="fastfetch --config ~/.config/fastfetch/config.jsonc"

alias cls="clear; fastfetch"


# ------------------------------
#  Git controls
# ------------------------------

# Searchable log graph
unalias glog
glog() {
    git log --graph --color \
        --format='%C(white)%h - %C(green)%cs - %C(blue)%s - %C(white)%an%C(red)%d' | fzf \
            --ansi \
            --reverse \
            --no-sort \
            -0
}

# Interactive git diff -- The selected files are added to the index
unalias gd
gd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview | xargs -r git add
}

# Interactive git diff --cached -- The selected files are removed from the index
unalias gdca
gdca() {
  preview="git diff $@ --color=always --cached -- {-1}"
  git diff $@ --name-only --cached | fzf -m --ansi --preview $preview | xargs -r git reset
}


fastfetch
