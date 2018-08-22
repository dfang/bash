

# cache fasd
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Load the shell dotfiles:
# * ~/.exports can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,bash_prompt,exports,aliases,functions,completions,extra,secrets}; do
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

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


# Key bindings 
# http://stackoverflow.com/questions/81272/is-there-any-way-in-the-os-x-terminal-to-move-the-cursor-word-by-word/
# http://superuser.com/questions/357355/how-can-i-get-controlleft-arrow-to-go-back-one-word-in-iterm2
# iTerm https://ruby-china.org/topics/1241
# now ctrl+b/f move word by word, bind -p to show key bindings
bind '"\C-b": backward-word'
bind '"\C-f": forward-word'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi


# keychain ~/.ssh/id_rsa
# source ~/.ssh-agent > /dev/null


# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# eval $(minikube docker-env)
# brew install bash_completion
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# you can add gcloud, minikube and kubectl completion
# kubectl completion bash > $(brew --prefix)/etc/bash_completion.d/kubectl
# minikube completion bash > $(brew --prefix)/etc/bash_completion.d/minikube
# kompose completion bash > $(brew --prefix)/etc/bash_completion.d/kompose
# brew cask info google-cloud-sdk
# curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker > `brew --prefix`/etc/bash_completion.d/docker
# Google Cloud SDK Completion
if [[ -d /usr/local/Caskroom/google-cloud-sdk/ ]]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/

# eval $(docker-machine env dev)


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh


# . /Users/mj23/.env

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Fix for cargo build in macOS, https://github.com/Antti/rust-amqp
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
export OPENSSL_LIB_DIR=/usr/local/opt/openssl/lib

