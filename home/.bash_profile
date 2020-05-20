# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

# like source ~/.env
export $(grep -v "^#" ~/.env | xargs)

is_true() (
    shopt -s nocasematch
    # Use the -z operator, and consider empty strings false
    if [ -z "$1" ] || [[ $1 =~ ^(false|0)$ ]]; then
      return 1 # false
    else
      return 0 # true
    fi
)

# output debug level log
function debug() { ((DEBUG_LOG)) && echo "### $*"; }

# by default, some plugins not loaded, you can load it manually
function load_plugin() { 
  if [ -z "$1" ] || [[ $1 =~ ^(false|0)$ ]]; then
    ls $HOME/.plugins | xargs -n 1
    return 1 # false
  else
    source "$HOME/.plugins/$1.sh" 
    return 0 # true
  fi
}

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

# printenv | grep ENABLE_
# if ${ENABLE_CHRUBY:false}; then
#   echo "CHRUBY"
# fi

if is_true $ENABLE_FASD; then
  load_plugin "fasd"
fi

if is_true $ENABLE_FZF; then
  load_plugin "fzf"
fi

if is_true $ENABLE_CHRUBY; then
  load_plugin "chruby"
fi

if is_true $ENABLE_PYENV; then
  load_plugin "pyenv"
fi  

if is_true $ENABLE_NVM; then
  load_plugin "nvm"
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
  load_plugin "travis"
fi

if is_true $ENABLE_THEFUCK; then
  load_plugin "thefuck"
fi


# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash


# yarn global bin is /usr/local/bin
# PATH=$PATH:`yarn global bin`

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/curl/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include -I/usr/local/opt/readline/include -I/usr/local/opt/openssl/include"
export CFLAGS="-I/usr/local/opt/curl/include -I/usr/local/opt/readline/include -I/usr/local/opt/openssl/include"


export FLUTTER_SDK_PATH='~/Library/flutter'
export ANDROID_SDK_PATH="$HOME/Library/android/sdk"
export ANDROID_HOME="$ANDROID_SDK_PATH"
export PATH="$PATH:$ANDROID_SDK_PATH/tools/bin"
alias sdkmanager="sdkmanager  --no_https \
        --proxy=http --proxy_host=localhost \
        --proxy_port=8118 "

export PATH="$PATH:~/Library/flutter/bin"
export PATH="$PATH:$HOME/.fastlane/bin"
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$PATH:/usr/local/kubebuilder/bin"

source "$HOME/google-cloud-sdk/completion.bash.inc"

alias rm='trash'
alias grm='gin run main.go'
alias bench='go test -run=^$ -bench=.'
alias sync='rsync -avhP --exclude=.git --exclude-from=.gitignore '


export PATH="/Users/mj/google-cloud-sdk/bin:$PATH"

export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.64.111


alias psql-staging='psql postgres://postgres:nDDy5ilok76E5ikG@47.103.58.246:16432/qor-staging'
alias psql-aws='psql postgres://postgres:nDDy5ilok76E5ikG@jdwl.c9d80cdaazgt.rds.cn-north-1.amazonaws.com.cn
:5432/qor'
alias psql-prod='psql postgres://postgres:nDDy5ilok76E5ikG@47.103.58.246:16432/qor-prod'

export GOOGLE_CLOUD_PROJECT=jdwl-245208

# Created by mirror-config-china
export IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NODIST_IOJS_MIRROR=https://npm.taobao.org/mirrors/iojs
export NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NVMW_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NODIST_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVMW_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVMW_NPM_MIRROR=https://npm.taobao.org/mirrors/npm
# End of mirror-config-china

alias uid="cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 18 | sed 1q"
# https://raymii.org/s/snippets/OpenSSL_Password_Generator.html
# openssl rand -hex 10
# fnm
eval "$(fnm env --multi)"

alias run_top_in_docker='docker run -it --rm --privileged --pid=host justincormack/nsenter1 /usr/bin/top'

alias ns='netstat -anl | grep -w LISTEN'

export STAGING_URL='https://us-central1-jdwl-245208.cloudfunctions.net/staging_xsjd_pubsub_topic_publish'


# delete all pod in default
# kubectl get pod | cut -f1 -d ' ' | tail -n+2 | xargs kubectl delete pod

alias kx='kubectx'

# kubectl -n ambassador get pod | cut -f1 -d " " | tail -n+2
alias short=" cut -f1 -d ' ' | tail -n +2"

# helm ls --output json | jq -r '.Releases[] | .Namespace'
# helm ls | cut -f7 | grep tenant- \
# helm ls | cut -f 1,7 | grep tenant- 
# helm ls | cut -f 1,7 | grep tenant- | xargs -n2 sh -c 'echo "release $0 is in namespace $1"'
# helm upgrade calling-lynx --set image.repository=dfang/qor-demo,image.tag=latest --namespace tenant-15d99242e9f7235d220d charts/qor
# helm ls | cut -f 1,7 | grep tenant- | xargs -n2 sh -c 'echo "helm upgrade $0 --set image.repository=dfang/qor-demo,image.tag=latest --namespace $1 charts/qor"'
# helm ls | awk '/DEPLOYED/ { print $1 }' 
# kubectl get svc --all-namespaces -l chart=qor-v0.1.0

export GOROOT=/usr/local/opt/go/libexec


source /Users/mj/.gvm/scripts/gvm
# to print the name and creation timestamp of each pod separated by a newline
# kubectl get pods -o go-template --template='{{range .items}}{{printf "%s %s\n" .metadata.name .metadata.creationTimestamp}}{{end}}'

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
