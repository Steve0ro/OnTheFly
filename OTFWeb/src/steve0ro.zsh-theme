# Original is Dark Blood Rewind
# Changed color, added emoji

PROMPT=$'%{$fg[orange]%}┌[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[orange]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[orange]%}] [%{$fg_bold[white]%}/dev/%y%{$reset_color%}%{$fg[orange]%}] %{$(git_prompt_info)%}%(?,,%{$fg[orange]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[orange]%}])
%{$fg[orange]%}└[%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[orange]%}]>%{$reset_color%} '
PS2=$' %{$fg[orange]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[orange]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[orange]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[orange]%}🕸️%{$reset_color%}"