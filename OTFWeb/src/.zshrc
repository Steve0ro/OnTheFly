# Exports
export ZSH="$HOME/.oh-my-zsh"
#export PATH=/usr/local/lib/nodejs/node-v18.16.1-linux-x64/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOBIN=$HOME/.go/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOBIN
export PATH=$PATH:/root/.cargo/bin
export PATH=$PATH:/root/.local/bin
export PYENV_ROOT="$HOME/.pyenv"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# ZSH Theme
ZSH_THEME="steve0ro"

# ZSH Plugins
plugins=(
    tmux
    git
    zsh-history-substring-search
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_DEFAULT_SESSION_NAME='Web'
ZSH_TMUX_CONFIG=~/.tmux.conf

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

autoload -U bashcompinit
bashcompinit

eval "$(pyenv init -)"

# Aliases
unalias gf
alias ip="ip -c"
alias vi='vim'
alias py='python'
alias grep='grep --color=always'
alias colorMe='highlight -O xterm256'
alias uz='unzip'
