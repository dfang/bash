# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi

chruby 2.5

# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
