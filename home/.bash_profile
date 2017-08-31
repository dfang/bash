# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,completions,extra,secrets}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


# cache fasd
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Key bindings 
# http://stackoverflow.com/questions/81272/is-there-any-way-in-the-os-x-terminal-to-move-the-cursor-word-by-word/
# http://superuser.com/questions/357355/how-can-i-get-controlleft-arrow-to-go-back-one-word-in-iterm2
# iTerm https://ruby-china.org/topics/1241
# now ctrl+b/f move word by word, bind -p to show key bindings
bind '"\C-b": backward-word'
bind '"\C-f": forward-word'
# or put these lines into ~/.bash_key_bindings
# "\C-b": backward-word
# "\C-f": forward-word
# "\C-dW": kill-word
# "\C-dL": kill-line
# "\C-dw": backward-kill-word
# "\C-dl": backward-kill-line
# "\C-da": kill-line

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# keychain ~/.ssh/id_rsa
# source ~/.ssh-agent > /dev/null


# http://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically
# http://superuser.com/questions/320065/bashrc-not-sourced-in-iterm-mac-os-x
if [[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi


# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi


# Google Cloud SDK Completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# eval $(minikube docker-env)
# brew install bash_completion
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# you can add gcloud, minikube and kubectl completion
# kubectl completion bash > $(brew --prefix)/etc/bash_completion.d/kubectl
# minikube completion bash > $(brew --prefix)/etc/bash_completion.d/minikube
# kompose completion bash > $(brew --prefix)/etc/bash_completion.d/minikube
# brew cask info google-cloud-sdk
# curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker > `brew --prefix`/etc/bash_completion.d/docker
