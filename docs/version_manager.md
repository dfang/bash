# asdf
elixir
erlang
asdf plugin-add python
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

# Node.js
fnm
.node-version

# Ruby
rbenv

# go
gvm


Expressions used with if

https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html


```

# fnm
eval "$(fnm env)"

# gvm
source $HOME/.gvm/scripts/gvm

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

````
