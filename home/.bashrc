if [[ -f ~/.bash_profile ]]; then
  source ~/.bash_profile
fi

# http://nuclearsquid.com/writings/git-tricks-tips-workflows/

eval $(docker-machine env dev)

alias remove_all_volumes="docker volume ls | tail +1 | sed '1d' | awk '{print $2}' | xargs docker volume rm"

alias v='vagrant'