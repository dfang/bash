[ -f ~/.bash_prompt ] && source ~/.bash_prompt

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/

# eval $(docker-machine env dev)

alias natapp='natapp -authtoken=f8143eabf894774b'

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
