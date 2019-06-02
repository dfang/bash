#!/bin/sh
echo "Sharing port $1 press Ctrl+C to exit"
# ssh -R 7070:localhost:"$1" -N root@your-server-ip
# ssh -R 80:localhost:8888 serveo.net
ssh -R 80:localhost:"$1" -N serveo.net


# https://serveo.net/

# Use your VPS as Ngrok Alternative (with SSH)
# https://blog.anam.co/ngrok-alternative-with-ssh/

# https://dev.to/k4ml/poor-man-ngrok-with-tcp-proxy-and-ssh-reverse-tunnel-1fm

# https://medium.com/@gabriel.bentara/ngrok-you-might-not-need-it-de4e3e34a55d



# pagekite.com
# packetriot.com
# Burrow.io
# Expose localhost to the internet. Created by Paulo Arruda

# https://openport.io/

# https://webhookrelay.com/
# Forward webhooks to localhost and expose servers behind firewalls and NATs without public IP/domain.

# TELECONSOLE
# Share your UNIX terminal in seconds!


# manifold.co

# webhookrelay.com

# https://blog.anam.co/ngrok-alternative-with-ssh/
