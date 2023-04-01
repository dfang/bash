[ -f /usr/local/opt/asdf/libexec/asdf.sh ] && source /usr/local/opt/asdf/libexec/asdf.sh
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# eval "$(direnv hook bash)"
source "$HOME/.config/asdf-direnv/bashrc"

# see asdf notes on notion
# export GOROOT="$(asdf where golang)/go"

debug "asdf loaded"


