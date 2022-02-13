# Tmux




## tips

tmux -f /dev/null show-options -s
tmux -f /dev/null show-options -g
tmux set -u -g status-format[0]

tmux -f /dev/null show-options -s \; show-options -g \; list-keys > tmux.defaults.conf
tmux -f /dev/null show-options -g

## kill server
tmux kill-server

## start tmux without conf
tmux -f /dev/null

If I understand the tmux man page correctly, you can reset a given option to the default with tmux set -u -g <option>.
tmux show -g, tmux show -g -s, and tmux show -g -w to get the session, server, and window options.

## show options and grep status
tmux show -g | grep status

tmux set-option -g status off && tmux set-option -g status on

bind r source-file ~/.tmux.conf \; display-message "Config reloaded".

tmux bind-key t set-option status

tmux list-keys | grep status

tmux refresh-client -S

## Set the status inverval so that it is updated every second:
tmux set status-interval 1
set -g status-interval 1

## Finding your current status line settings
tmux show-options -g | grep status

## use C-a but keep C-b
set -g prefix2 C-a                        # GNU-Screen compatible prefix
bind C-a send-prefix -2

# # --------------------------------------------------------------------------
# # Automatic tpm installation
# if "test ! -d ~/.tmux/plugins/tpm" \
#    "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

# # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
# run -b '~/.tmux/plugins/tpm/tpm'

set-option -g status-right '#(curl icanhazip.com)'

https://tmuxcheatsheet.com/
https://dev.to/jbranchaud/the-modes-of-tmux-3d86
https://arcolinux.com/everything-you-need-to-know-about-tmux-status-bar/
https://devhints.io/tmux
https://blog.bengadbois.com/post/tmux-tricks/

https://danielmiessler.com/study/tmux/
