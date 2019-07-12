" vim:fdm=marker
"     __                                    _                    
"    / /_  _______  ______ _____     _   __(_)___ ___  __________
"   / __ \/ ___/ / / / __ `/ __ \   | | / / / __ `__ \/ ___/ ___/
"  / /_/ / /  / /_/ / /_/ / / / /   | |/ / / / / / / / /  / /__  
" /_.___/_/   \__, /\__,_/_/ /_/    |___/_/_/ /_/ /_/_/   \___/  
"           /____/                                              
" essential state and remappings {{{
set nocompatible
set nu
set clipboard=unnamedplus
set updatetime=500
"allow sb to jump to existing tab
:set swb=usetab
"ruler 80
:set cc=80
imap <C-i> <Esc>
imap jj <Esc>
tnoremap jj <C-\><C-n>
tnoremap <Esc> <C-\><C-N>
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
" }}}
" Plugins {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'scrooloose/nerdtree'
Plug 'wesQ3/vim-windowswap'
Plug 'qwertologe/nextval.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/PapayaWhip'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/taglist.vim'
Plug 'apalmer1377/factorus'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/neovim-remote'
Plug 'elzr/vim-json'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'spolu/dwm.vim'
Plug 'embear/vim-localvimrc'
Plug 'ludovicchabant/vim-gutentags'
Plug 'simplyzhao/cscope_maps.vim'
Plug 'gburca/vim-logcat'
Plug 'neomutt/neomutt.vim'
Plug 'tfnico/vim-gradle'
Plug 'wincent/replay'
Plug 'Houl/repmo-vim'
"local fzf install watch out on new machines
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rhysd/vim-clang-format'
Plug 'rhysd/vim-grammarous'
Plug 'bennyyip/vim-yapf'
Plug 'Rip-Rip/clang_complete'
Plug 'maksimr/vim-jsbeautify'
Plug 'slashmili/alchemist.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#build()}}
Plug 'craigemery/vim-autotag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gcmt/taboo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/vim-auto-save'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/csv.vim'
Plug 'vim-scripts/textutil.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fubitive'
Plug 'christoomey/vim-conflicted'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'vimlab/split-term.vim'
Plug 'vim-scripts/vcscommand.vim'
Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'
Plug 'LucHermitte/vim-refactor'
Plug 'Chiel92/vim-autoformat'
Plug 'danro/rename.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" colors
if has('mac')
	Plug 'Dinduks/vim-holylight'
endif
Plug 'wimstefan/vim-artesanal'
Plug 'lifepillar/vim-wwdc17-theme'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'icymind/NeoSolarized'

call plug#end()
" }}}
"addbreviations {{{
:abbreviate #t # TODO(btidwell):
" }}}

" #Custom leader mappings {{{
"refresh
map <leader>e :e!<CR>
" close
map <leader>zz :q!<CR>
nmap gzz :q!<CR>
map <leader>tl :tabclose<CR>
nmap tl :tabclose<CR>
"save
map <leader>ss :w<CR>
nnoremap <C-s> :w<CR>
nnoremap s i_<Esc>r
nnoremap <leader>y ggVGy''
nnoremap <leader>sa :wa<CR>
"add line spacing without leaving normal mode
nmap <leader>o o<Esc>x
nmap <leader>O O<Esc>x

"other
map <leader>nn :noh<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nt :NERDTreeToggle<CR>

map <leader>fm :Autoformat<CR>
"stolen from Erik Falor
nnoremap Q !!sh<CR>
nnoremap <leader>sb :set scrollbind!<CR>
" insert date
" todo
" 1. don't insert on new line
" 2. use function and support formatting
map <leader>dte :put =strftime(\"%c\")<CR>
" }}}

" fzf {{{
map <leader>fi :Files<CR>
map <leader>hi :History:<CR>
map <leader>hp :History/<CR>
map <leader>hh :History<CR>
map <leader>rg :Rg<CR>
map <leader>gf :GFiles<CR>
map <leader>gs :GFiles?<CR>
map <leader>ff :Buffers<CR>
"fzf config
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit' }

" }}}

" open config files {{{
nnoremap <leader>rr :source $MYVIMRC<CR>
nnoremap <leader>re :tabnew $MYVIMRC<CR>
if !has('mac') && !has('wsl')
   nnoremap <leader>i3 :tabnew ~/.config/i3/config<CR>
endif
if has('mac')
   nnoremap <leader>ch :tabnew ~/.chunkwmrc<CR>
   nnoremap <leader>sk :tabnew ~/.skhdrc<CR>
endif

nnoremap <leader>rz :tabnew ~/.zshrc<CR>
nnoremap <leader>rlz :tabnew ~/.lzshrc<CR>
"}}}

" spelling {{{
nnoremap <leader>sp :set spell<CR>
nnoremap <leader>nsp :set nospell<CR>
" }}}


"vim session settings {{{
let g:session_autosave_silent = 'true'
let g:session_autosave_periodic = 5
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_default_name = 'default'
" }}}

"diff settings {{{
set diffopt+=vertical
set diffopt+=iwhite
set diffexpr="\n"
"show vim-confliced info in statusbar
set stl+=%{ConflictedVersion()}
" }}}

"tab remappings {{{ 
noremap <left> :tabprevious<CR>
nnoremap <right> :tabnext<CR>
" }}}

"folds {{{
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent
autocmd FileType vim setlocal foldmethod=foldmarker
"toggle all folds
:nnoremap <expr> <leader>zf &foldlevel ? 'zM' :'zR'
" }}}
" search macros and mappings {{{
function! Search_clipboard()
	execute '/' . @*
endfunction

function! Find_trailing_spaces()
	execute '/\s$'
endfunction

function! Find_Exception()
	execute '/Exception'
endfunction


"search for copied text
map <leader>sh :call Search_clipboard()<CR>
map <leader>tsp :call Find_trailing_spaces()<CR>
map <leader>err :call Find_Exception()<CR>
" }}}

"Markdown {{{
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
if has('mac')
	let g:mkdp_browser = 'FireFox'
else
	let g:mkdp_browser='firefox'
endif
"vim-markdown options
let g:vim_markdown_no_extensions_in_markdown = 1
autocmd filetype markdown  noremap <buffer> <C-m> :MarkdownPreview<CR>
" }}}
" auto save {{{
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
" }}}
" vagrant ruby highlight {{{
" Teach vim to syntax highlight Vagrantfile as ruby
"
" Install: $HOME/.vim/plugin/vagrant.vim
" Author: Brandon Philips <brandon@ifup.org>

augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
" }}}

" GitGutter remappings {{{
nmap gs <Plug>GitGutterStageHunk
nmap gu <Plug>GitGutterUndoHunk
nmap gp <Plug>GitGutterPreviewHunk
nnoremap gn :GitGutterNextHunk<CR>
nnoremap gp :GitGutterPrevHunk<CR>
" }}}
" nvim remote {{{
" set neovim remote
if has('nvim')
	let $VISUAL = 'nvr -cc split --remote-wait'
endif
" }}}

" vim folder/files stuff {{{
nnoremap gk :let @+ = expand("%:p")<cr>
nnoremap gke :let @+ = expand("%:t")<cr>
nnoremap pwd :let @+ = getcwd()<cr>
" }}}

" Crontab {{{
" "https://www.calebthompson.io/crontab-and-vim-sitting-in-a-tree
autocmd filetype crontab setlocal nobackup nowritebackup
"}}}
" autoformat options {{{
let g:clang_format#command='clang-format-3.9'
let b:formatdef_custom_c='"clang-format-3.9 -style=file"'
let b:formatters_c = ['custom_c']
" ensure all c files are formatted on save
au BufWrite *.c :Autoformat
au BufWrite *.h :Autoformat
" ensure all python files are formatted on save
au BufWrite *.py :Autoformat
let g:yapf#auto_format_on_insert_leave='0'
" }}}
" remember last pos in file {{{
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" }}}

" airline {{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" }}}

" Android {{{
"android
let g:android_sdk_path = $ANDROID_SDK
" }}}

" Copied from Coc github {{{

" __coc config__ bunch of arcane stuff for the rest of the file

" if hidden not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
" I accidentally trigger this all the time and it's annoying
"nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" virtual j k
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"NeoSolarized color options
syntax enable
set background=light
set termguicolors
let g:solarized_termcolors=256
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"
let g:gruvbox_contrast_light = "hard"
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
if has("gui_running")
	unset termguicolors
endif

" Shortcuts for denite interface
" Show extension list
nnoremap <silent> <space>e  :<C-u>Denite coc-extension<cr>
" Show symbols of current buffer
nnoremap <silent> <space>o  :<C-u>Denite coc-symbols<cr>
" Search symbols of current workspace
nnoremap <silent> <space>t  :<C-u>Denite coc-workspace<cr>
" Show diagnostics of current workspace
nnoremap <silent> <space>a  :<C-u>Denite coc-diagnostic<cr>
" Show available commands
nnoremap <silent> <space>c  :<C-u>Denite coc-command<cr>
" Show available services
nnoremap <silent> <space>s  :<C-u>Denite coc-service<cr>
" Show links of current buffer
nnoremap <silent> <space>l  :<C-u>Denite coc-link<cr>
" }}}
