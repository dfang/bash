[ -f ~/.bash_prompt ] && source ~/.bash_prompt

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/

# eval $(docker-machine env dev)

alias natapp='natapp -authtoken=f8143eabf894774b'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.bin/tmuxinator.bash

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
