# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

# source ~/.env
export $(cat ~/.env | xargs -n1)

is_true() (
    shopt -s nocasematch
    # Use the -z operator, and consider empty strings false
    if [ -z "$1" ] || [[ $1 =~ ^(false|0)$ ]]; then
      return 1 # false
    else
      return 0 # true
    fi
)

function debug() { ((DEBUG_LOG)) && echo "### $*"; }


if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

# printenv | grep ENABLE_

if ${ENABLE_CHRUBY:false}; then
  echo "CHRUBY"
fi

if is_true $ENABLE_FASD; then
  eval "$(fasd --init auto)"
  debug "fasd loaded"
fi

if is_true $ENABLE_CHRUBY; then
  # Initialize ruby
  if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
  fi
  chruby 2.5
  debug "chruby loaded"
fi

if is_true $ENABLE_PYENV; then
  # Initialize python
  # To enable shims and autocompletion add to your profile:
  if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
  if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
  pyenv global 3.7.1
  debug "pyenv loaded"
fi

if is_true $ENABLE_NVM; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
  debug "nvm loaded"
fi

if is_true $ENABLE_FZF; then
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  debug "fzf loaded"
fi

if is_true $ENABLE_ITERM2_SHELL_INTEGRATION; then
  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
  debug "item2 shell integration loaded"
fi

if is_true $ENABLE_TMUXINATOR; then
  [ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash
  debug "tmuxinator loaded"
fi


if is_true $ENABLE_TRAVIS; then
  # added by travis gem
  [ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
  debug "travis gem loaded"
fi

if is_true $ENABLE_THEFUCK; then
  # Initalize thefuck
  eval $(thefuck --alias)
  debug "thefuck loaded"
fi


# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash


# yarn global bin is /usr/local/bin
# PATH=$PATH:`yarn global bin`


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


export FLUTTER_SDK_PATH='~/Library/flutter'
export ANDROID_SDK_PATH='~/Library/android/sdk'
export PATH="$PATH:~/Library/flutter/bin"
export PATH="$PATH:$HOME/.fastlane/bin"

alias rm='trash'
alias grm='gin run main.go'
alias bench='go test -run=^$ -bench=.'
alias rsync='rsync -avhP --exclude=.git --exclude-from=.gitignore '


export PATH="$HOME/google-cloud-sdk/bin:$PATH"
