# shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi
