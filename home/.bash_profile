# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mj/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/mj/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mj/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/mj/Downloads/google-cloud-sdk/completion.bash.inc'; fi

chruby 2.5

export PATH=$HOME/.conduit/bin:$PATH
export ipfs_api='127.0.0.1:5001/api/v0'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
