shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

# Initialize ruby
if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi
chruby 2.5

# Initialize python
# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash



# yarn global bin is /usr/local/bin
# PATH=$PATH:`yarn global bin`

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Initalize thefuck
eval $(thefuck --alias)

# https://apple.stackexchange.com/questions/118464/how-to-find-out-which-terminal-app-iterm-or-terminal-is-running-from-within-ba
if [ "$TERM_PROGRAM" == "iTerm.app" ]; then
	export PS1='\[\e[32m\]\w λ \[\e[36m\] '
else
	export PS1='\[\e[32m\] λ \[\e[36m\] '
fi
