# Load the shell dotfiles:
# * ~/.exports can be used to extend `$PATH`.
# * ~/.extras can be used for other settings you don’t want to commit.
# * ~/.secrets puts secret env credentials such as AWS_ACCESS_SECRET_KEY, you must not commit it.
# * ~/.aliases can be used for aliases.
# * ~/.functions can be used for functions.
# * ~/.bash_prompt can be used for custom bash prompt.
for file in ~/.{exports,bash_prompt,aliases,functions,extras,secrets}; do
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

# clash_proxy > /dev/null

export GOS_UPSTREAM_ADDRESS=https://goproxy.cn

export HOMEBREW_NO_AUTO_UPDATE=1

#export GOPATH=$HOME/odev

# for python user-site packages, eg. pipenv
export PATH=$PATH:~/.local/bin

export AWS_REGION=us-west-1

proxy > /dev/null

# PUT ssh alias and AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY etc in .bash.local
# and add it to .gitignore
source ~/.bash.local
