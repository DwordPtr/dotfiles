" Copy-Paste stuff
set clipboard=unnamedplus
imap <C-i> <Esc>
vmap <C-i> <Esc>
set nu

" ensure vim plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

 "vim plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'ejholmes/vim-forcedotcom'
Plug 'endel/vim-github-colorscheme'
call plug#end()

:colorscheme github
