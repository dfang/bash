" Automatically install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set nocompatible

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
call plug#end()

set fileencoding=utf-8
syntax on
filetype plugin indent on

let mapleader = ","
