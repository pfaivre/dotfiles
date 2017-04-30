# Oh-my-zsh theme inspired by cmder (http://cmder.net/)
# By Pierre Faivre

# Lambda grey if success else lambda red
local ret_status="%(?:%{$fg[grey]%}:%{$fg_bold[red]%})λ"

# <pwd> <git>
# λ
PROMPT='%{$fg[green]%}%~%{$reset_color%} $(git_prompt_status)$(git_prompt_info)
${ret_status}%{$reset_color%} '

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
