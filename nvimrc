set nu
imap <C-i> <Esc>

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

"Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/PapayaWhip'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/taglist.vim'
Plug 'apalmer1377/factorus'
Plug 'junegunn/fzf.vim'
"Plug 'embear/vim-localvimrc'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lygaret/autohighlight.vim'
Plug 'gburca/vim-logcat'
call plug#end()

set clipboard=unnamed
set updatetime=500
"map <C-n> :NERDTreeToggle<CR>
"map <t> /\| <A-v>
let $Tlist_Ctags_Cmd='/bin/ctags'
" cache ctrlp
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" editing macros
" if something goes wrong note the escaping
let @w = "\/\\cpV8jy\'\'"
let @c = "\/\\cp3n"
let @n = "h2jvwhh\"pyl"
let @i = "@n@w"

tnoremap <Esc> <C-\><C-N>
