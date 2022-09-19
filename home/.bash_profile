# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH";

# like source ~/.env
export $(grep -v "^#" ~/.env | xargs)

# Helper functions
[[ -s "$HOME/.helper" ]] && source "$HOME/.helper"

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# printenv | grep ENABLE_

if ${ENABLE_FASD:true}; then
  load_plugin "fasd"
fi

if ${ENABLE_ASDF:true}; then
  load_plugin "asdf"
fi

if ${ENABLE_FZF:true}; then
  load_plugin "fzf"
fi

if ${ENABLE_CHRUBY:false}; then
  load_plugin "chruby"
fi

if is_true $ENABLE_PYENV; then
  load_plugin "pyenv"
fi

if is_true $ENABLE_NVM; then
  load_plugin "nvm"
fi

if is_true $ENABLE_TRAVIS; then
  load_plugin "travis"
fi

if is_true $ENABLE_THEFUCK; then
  load_plugin "thefuck"
fi

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

alias sync='echo rsync -avhP --exclude=.git --exclude-from=.gitignore --dry-run SRC DESTINATION'

export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.64.111

alias uid="cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 18 | sed 1q"
# https://raymii.org/s/snippets/OpenSSL_Password_Generator.html
# openssl rand -hex 10

alias run_top_in_docker='docker run -it --rm --privileged --pid=host justincormack/nsenter1 /usr/bin/top'

alias ns='netstat -anl | grep -w LISTEN'

# delete all pod in default
# kubectl get pod | cut -f1 -d ' ' | tail -n+2 | xargs kubectl delete pod


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

# to print the name and creation timestamp of each pod separated by a newline
# kubectl get pods -o go-template --template='{{range .items}}{{printf "%s %s\n" .metadata.name .metadata.creationTimestamp}}{{end}}'


# export JAVA_17_HOME=$(/usr/libexec/java_home -v17)
# alias java17='export JAVA_HOME=$JAVA_17_HOME'
# java17 # default to Java 17

# eval "$(ssh-agent)"

