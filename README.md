### Install homesick  
`sudo gem install homesick`

### Clone castle
`homesick clone dfang/bash`  

### Link castle  
`homesick link bash`  

### Update castle
`homesick pull bash`  

### Install some homebrew formula first(check docs/.BREWS_AND_GEMS in castle bash)
`brew install fasd fzf tree ssh-copy-id`

### links
1. [homesick](https://github.com/technicalpickles/homesick)  
2. [mathiasbynens's dotfiles](https://github.com/mathiasbynens/dotfiles)

### homesick not found

如果还没有安装ruby，使用系统自带有的ruby，gem install homesick之后，homesick 命令仍然不可用，可以通过`gem environment | grep -A5 "GEM PATHS"` 找到gem的执行路径，比如`/Library/Ruby/Gems/2.6.0/gems/homesick-1.1.6/bin/homesick -h`


