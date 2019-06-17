# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'
source ~/.env

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

printenv | grep ENABLE_CHRUBY

if [[ ! -z "${ENABLE_FASD}"  && $ENABLE_FASD == true ]]; then
  # cache fasd
  fasd_cache="$HOME/.fasd-init-bash"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
  echo "fasd loaded"
fi

if [[ ! -z "${ENABLE_CHRUBY}" ]]; then
  # Initialize ruby
  if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
  fi
  chruby 2.5
  echo "chruby loaded"
fi

if [[ ! -z "${ENABLE_CHRUBY}" ]]; then
  # Initialize python
  # To enable shims and autocompletion add to your profile:
  if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
  if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
  pyenv global 3.7.1
  echo "pyenv loaded"
fi


if [[ ! -z "${ENABLE_NVM}" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
  echo "nvm loaded"
fi

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

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/curl/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include -I/usr/local/opt/readline/include -I/usr/local/opt/openssl/include"
export CFLAGS="-I/usr/local/opt/curl/include -I/usr/local/opt/readline/include -I/usr/local/opt/openssl/include"

alias rm='trash'

export FLUTTER_SDK_PATH='~/Library/flutter'
export ANDROID_SDK_PATH='~/Library/android/sdk'

export PATH="$PATH:~/Library/flutter/bin"
export PATH="$PATH:$HOME/.fastlane/bin"

alias grm='gin run main.go'
alias bench='go test -run=^$ -bench=.'
alias rsync='rsync -avP --exclude=.git --exclude-from=.gitignore '
