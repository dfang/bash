# Load the shell dotfiles:
# * ~/.exports can be used to extend `$PATH`.
# * ~/.extras can be used for other settings you don’t want to commit.
# * ~/.secrets puts secret env credentials such as AWS_ACCESS_SECRET_KEY, you must not commit it.
for file in ~/.{profile,exports,aliases,bash_prompt,functions,completions,extras,secrets}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Store multi-line commands in one history entry:
shopt -s cmdhist

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Key bindings 
# http://stackoverflow.com/questions/81272/is-there-any-way-in-the-os-x-terminal-to-move-the-cursor-word-by-word/
# http://superuser.com/questions/357355/how-can-i-get-controlleft-arrow-to-go-back-one-word-in-iterm2
# iTerm https://ruby-china.org/topics/1241
# now ctrl+b/f move word by word, bind -p to show key bindings
bind '"\C-b": backward-word'
bind '"\C-f": forward-word'

# keychain ~/.ssh/id_rsa
# source ~/.ssh-agent > /dev/null

# eval $(minikube docker-env)
# brew install bash_completion
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# you can add gcloud, minikube and kubectl completion
# kubectl completion bash > $(brew --prefix)/etc/bash_completion.d/kubectl
# minikube completion bash > $(brew --prefix)/etc/bash_completion.d/minikube
# kompose completion bash > $(brew --prefix)/etc/bash_completion.d/kompose
# brew cask info google-cloud-sdk
# curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker > `brew --prefix`/etc/bash_completion.d/docker
# # Google Cloud SDK Completion
# if [[ -d /usr/local/Caskroom/google-cloud-sdk/ ]]; then
#   source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
#   source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
# fi

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/

# eval $(docker-machine env dev)

# . /Users/mj23/.env

# clash_proxy > /dev/null


# kubectl krew plugin manager
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export GOS_UPSTREAM_ADDRESS=https://goproxy.cn
#export GOPATH=$HOME/odev
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
# NAMESPACE is the list of namespaces the Operator will watch
export NAMESPACE=pgouser1,pgouser2

# PGO_OPERATOR_NAMESPACE is the namespace the Operator is deployed into
export PGO_OPERATOR_NAMESPACE=pgo

# PGO_CMD values are either kubectl or oc, use oc if Openshift
export PGO_CMD=kubectl

# the directory location of the Operator scripts
export PGOROOT=$GOPATH/src/github.com/crunchydata/postgres-operator

# the version of the Operator you run is set by these vars
export PGO_IMAGE_PREFIX=crunchydata
export PGO_BASEOS=centos7
export PGO_VERSION=4.0.0
export PGO_IMAGE_TAG=$PGO_BASEOS-$PGO_VERSION

# for the pgo CLI to authenticate with using TLS
export PGO_CA_CERT=$PGOROOT/conf/postgres-operator/server.crt
export PGO_CLIENT_CERT=$PGOROOT/conf/postgres-operator/server.crt
export PGO_CLIENT_KEY=$PGOROOT/conf/postgres-operator/server.key

# common bash functions for working with the Operator
setip() 
{ 
	export PGO_APISERVER_URL=https://`$PGO_CMD -n "$PGO_OPERATOR_NAMESPACE" get service postgres-operator -o=jsonpath="{.spec.clusterIP}"`:8443 
}

alog() {
$PGO_CMD  -n "$PGO_OPERATOR_NAMESPACE" logs `$PGO_CMD  -n "$PGO_OPERATOR_NAMESPACE" get pod --selector=name=postgres-operator -o jsonpath="{.items[0].metadata.name}"` -c apiserver
}

olog () {
$PGO_CMD  -n "$PGO_OPERATOR_NAMESPACE" logs `$PGO_CMD  -n "$PGO_OPERATOR_NAMESPACE" get pod --selector=name=postgres-operator -o jsonpath="{.items[0].metadata.name}"` -c operator
}

slog () {
$PGO_CMD  -n "$PGO_OPERATOR_NAMESPACE" logs `$PGO_CMD  -n "$PGO_OPERATOR_NAMESPACE" get pod --selector=name=postgres-operator -o jsonpath="{.items[0].metadata.name}"` -c scheduler
}
# export KUBECONFIG=/Users/mj/.kube/microk8s


alias cmk='cd `mktemp -d -p /tmp`'

export PATH="$PATH":"$HOME/.pub-cache/bin"

export PATH="$PATH:~/bin/istio-1.5.4/bin"

export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "/Users/mj/.gvm/scripts/gvm" ]] && source "/Users/mj/.gvm/scripts/gvm"
