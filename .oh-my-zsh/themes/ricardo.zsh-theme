PROMPT=' ${return_status} %{$fg[blue]%}$(get_pwd)%{$reset_color%} ${prompt_suffix}'
RPROMPT='$(git_prompt_info)'
local return_status="%(?:%{$fg_bold[green]%}[%n@%m]:%{$fg_bold[red]%}[%n])"

local prompt_suffix="%{$fg[magenta]%}❯%{$reset_color%} "

# by shashankmehta (https://github.com/shashankmehta)
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}\u25cf%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}\u25cf%{$reset_color%}"
