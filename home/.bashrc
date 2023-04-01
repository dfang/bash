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


################## History related settings
export HISTSIZE=5000                     #
export HISTFILESIZE=100000               #
shopt -s histappend                      # append to history, , rather than overwriting it
export HISTIGNORE="ls:ps:history"        # Don’t save ls, ps and history commands:
export HISTCONTROL=ignoredups:erasedups:ignorespace  # no duplicate entries, leading space hides commands from history
shopt -s cmdhist                         # Store multi-line commands in one history entry:
# export HISTFILE=~/.bash_history_$(date '+%Y%m%d').txt
# export HISTTIMEFORMAT="%h %d %H:%M:%S "
# https://www.shellhacks.com/tune-command-line-history-bash/
# export PROMPT_COMMAND='$PROMPT_COMMAND; history -a'
# https://linuxhint.com/bash_command_history_usage/
# https://www.rootusers.com/17-bash-history-command-examples-in-linux/
# https://unix.stackexchange.com/questions/41739/keep-only-successful-commands-in-bash-history
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

shopt -s extglob

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

# https://stackoverflow.com/a/57968002
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

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


# for python user-site packages, eg. pipenv
export PATH=$PATH:~/.local/bin


# proxy > /dev/null

# BEST PRACTICES:
# PUT ssh alias and AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, CLOUDFLARE_TOKEN etc in .bashrc.local
# and add it to .gitignore
source ~/.bashrc.local

bind "\C-o":jd








