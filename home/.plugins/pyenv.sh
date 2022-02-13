#! /bin/sh

# Initialize python
# To enable shims and autocompletion add to your profile:
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
debug "pyenv loaded"
