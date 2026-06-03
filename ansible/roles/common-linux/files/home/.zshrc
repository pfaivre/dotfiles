# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin/:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="candy"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found sudo colored-man-pages fzf)

export DISABLE_UPDATE_PROMPT=true
source $ZSH/oh-my-zsh.sh

# Load vcs_info function to show git branch name in the prompt (if displayed in the theme)
autoload -Uz vcs_info
precmd() { vcs_info }

# You may need to manually set your language environment
#export LANG=fr_FR.UTF-8
#export LC_ALL=fr_FR.UTF-8

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ------------------------------
#  Aliases
# ------------------------------

alias pwgen="pwgen -c -n -y -s 16"

alias u="~/.local/bin/update-system.sh"

alias fastfetch="fastfetch --config ~/.config/fastfetch/config.jsonc"

alias cls="clear"


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
