[ -f ~/.bash_prompt ] && source ~/.bash_prompt

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/

# eval $(docker-machine env dev)

export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOPATH/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh


alias ssh-babycare-root="ssh root@119.29.178.236"
alias ssh-babycare-deployer="ssh deployer@119.29.178.236"
alias mosh-babycare-deployer="ssh deployer@119.29.178.236"
alias ssh-zhangyu="ssh deployer@120.26.207.136"
alias ssh-odoo="ssh ubuntu@119.29.86.189"
alias mosh-odoo="mosh ubuntu@119.29.86.189"
alias mosh-deployer="mosh deployer@119.29.178.236"

proxy(){
    export HTTP_PROXY="http://127.0.0.1:8118" # http代理地址
    export HTTPS_PROXY="http://127.0.0.1:8118" # https代理地址
    echo "HTTP Proxy on"
}

noproxy(){
    unset HTTP_PROXY
    unset HTTPS_PROXY
    echo "HTTP Proxy off"
}

alias workshop="cd /Users/mj23/Downloads/docker_workshop_for_participants"

. /Users/mj23/.env

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/bash_autocomplete

export HELM_HOME=$HOME/.helm
