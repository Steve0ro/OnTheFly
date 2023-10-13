# Original is Dark Blood Rewind
# Changed color, added emoji

PROMPT=$'%{$fg[purple]%}┌[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[purple]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[purple]%}] [%{$fg_bold[white]%}/dev/%y%{$reset_color%}%{$fg[purple]%}] %{$(git_prompt_info)%}%(?,,%{$fg[purple]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[purple]%}])
%{$fg[purple]%}└[%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[purple]%}]>%{$reset_color%} '
PS2=$' %{$fg[purple]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[purple]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[purple]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[purple]%}👾%{$reset_color%}"