export ZSH=/home/tomokane/.oh-my-zsh

alias vi="vim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias xflux_tokyo="xflux12 -l 35.689487 -g -2 -r 0"
alias global_ip="curl ipinfo.io/ip"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8

export PATH=/home/tomokane/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=/usr/local/cuda/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cudnn-6.0/cuda/lib64:$LD_LIBRARY_PATH

# golang
export GOPATH=/home/tomokane/work
export PATH=$GOPATH/bin:$PATH

bindkey '^]' peco-src

function peco-src() {
	local src=$(ghq list --full-path | grep 'github\.com\/tomokane' | peco --query "$LBUFFER")
	if [ -n "$src" ]; then
		BUFFER="cd $src"
		zle accept-line
	fi
	zle -R -c
}
zle -N peco-src

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodejs
setopt no_nomatch
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
nvm use default
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# openmpi
export PATH=/usr/local/mpi/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/mpi/lib:$LD_LIBRARY_PATH

# cntk
export PATH="$HOME/ml/cntk/build/release/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/ml/cntk/build/release/lib:$LD_LIBRARY_PATH"
export KERAS_BACKEND=cntk
export PYTHONPATH=$HOME/ml/cntk/bindings/python:$PYTHONPATH
export LD_LIBRARY_PATH=$HOME/ml/cntk/bindings/python/cntk/libs:$LD_LIBRARY_PATH

# caffe2
export PYTHONPATH=/usr/local:$PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/home/tomokane/ml/caffe2/build

# openlava
export PATH="/opt/openlava-4.0/bin:$PATH"

# tensorflow
export CUDA_HOME="/usr/local/cuda"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# kubernete
source <(kubectl completion zsh)

plugins=(git bundler rake ruby aws colorize ubuntu golang python rails rbenv pyenv tmux docker docker-compose)
source $ZSH/oh-my-zsh.sh

# powerline-status
. .local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
