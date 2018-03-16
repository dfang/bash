# login shell vs nonlogin shell

A login shell will try ~/.bash_profile, ~/.bash_login and ~/.profile in order and only open the first one it finds.

add echo to .bash_profile, and try command + t in iTerm

a nonlogin shell will try ~/.bashrc, eg. try homesick cd


# how to tell if login shell or nonlogin shell

```
shopt -q login_shell && echo 'Login shell' || echo 'Not login shell'
```

* https://unix.stackexchange.com/questions/26676/how-to-check-if-a-shell-is-login-interactive-batch/26691
* https://superuser.com/questions/320065/bashrc-not-sourced-in-iterm-mac-os-x
