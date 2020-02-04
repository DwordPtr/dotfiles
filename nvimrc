" vim:fdm=marker
"     __                                    _
"    / /_  _______  ______ _____     _   __(_)___ ___  __________
"   / __ \/ ___/ / / / __ `/ __ \   | | / / / __ `__ \/ ___/ ___/
"  / /_/ / /  / /_/ / /_/ / / / /   | |/ / / / / / / / /  / /__
" /_.___/_/   \__, /\__,_/_/ /_/    |___/_/_/ /_/ /_/_/   \___/
" 
" 
" essential state and remappings {{{
set nocompatible
:set nu
nnoremap <leader>rl :set rnu!<CR>
set clipboard=unnamedplus
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set updatetime=500
set tabstop=4
set softtabstop=4
set expandtab
"allow sb to jump to existing tab
:set swb=usetab
"ruler 80
:set cc=80
imap <C-i> <Esc>
imap jj <Esc>
tnoremap jj <C-\><C-n>
" virtual j k
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
tnoremap <Esc> <C-\><C-N>
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
" }}}
" Plugins {{{
" Plug autoload {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

"Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'scrooloose/nerdtree'
Plug 'wesQ3/vim-windowswap'
Plug 'vim-scripts/PapayaWhip'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'
" tag plugins {{{
Plug 'vim-scripts/taglist.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'craigemery/vim-autotag'
Plug 'simplyzhao/cscope_maps.vim'
" }}}
" fzf {{{
Plug 'junegunn/fzf.vim'
"local fzf install watch out on new machines
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" }}}
Plug 'mhinz/neovim-remote'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'embear/vim-localvimrc'
Plug 'gburca/vim-logcat'
Plug 'neomutt/neomutt.vim'
Plug 'tfnico/vim-gradle'
Plug 'wincent/replay'
Plug 'Houl/repmo-vim'
" formatting plugins {{{
Plug 'rhysd/vim-grammarous'
Plug 'bennyyip/vim-yapf'
Plug 'Rip-Rip/clang_complete'
Plug 'maksimr/vim-jsbeautify'
Plug 'Chiel92/vim-autoformat'
" }}}
" language/file format specific plugins {{{
Plug 'slashmili/alchemist.vim'
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'lervag/vimtex'
" }}}
" CoC Extensions {{{
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#build()}}
Plug 'tjdevries/coc-zsh'
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
"}}}
" snippet extensions {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/csv.vim'
" }}}
" cosmetic plugins {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}
Plug 'gcmt/taboo.vim'
" markdown plugins {{{
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'esalter-va/vim-checklist'
" }}}
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-scripts/textutil.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fubitive'
Plug 'christoomey/vim-conflicted'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'godlygeek/tabular'
Plug 'vimlab/split-term.vim'
Plug 'vim-scripts/vcscommand.vim'
" numbers and colors {{{
Plug 'qwertologe/nextval.vim'
Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/rainbow_parentheses.vim'
" }}}
" refactor plugins {{{
Plug 'LucHermitte/vim-refactor'
Plug 'apalmer1377/factorus'
" }}}
Plug 'sedm0784/vim-you-autocorrect'
Plug 'danro/rename.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" mac plugins {{{
if has('mac')
        Plug 'Dinduks/vim-holylight'
endif
" }}}
" color schemes {{{
Plug 'wimstefan/vim-artesanal'
Plug 'lifepillar/vim-wwdc17-theme'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'altercation/vim-colors-solarized'
Plug 'gruvbox-community/gruvbox'
Plug 'icymind/NeoSolarized'
" }}}

call plug#end()
" }}}
"addbreviations {{{
:abbreviate #t # TODO(btidwell):
" }}}
" Custom leader mappings {{{
"refresh
map <leader>e :e!<CR>
" close
map <leader>zz :q!<CR>
nmap gzz :q!<CR>
nnoremap go <C-w>gf
nnoremap gw <C-w><C-]>1<CR><CR>
nnoremap gwn :tn<CR>
nnoremap gwp :tp<CR>
nmap gq @q
map <leader>tl :tabclose<CR>
nmap tl :tabclose<CR>
"save
map <leader>ss :w<CR>
nnoremap <C-s> :w<CR>
nnoremap s :w<CR>
"nnoremap s i_<Esc>r
nnoremap <leader>y ggVGy''
nnoremap <leader>sa :wa<CR>
"add line spacing without leaving normal mode
nmap <leader>o o<Esc>x
nmap <leader>O O<Esc>x
nmap <leader>np :set nopaste<CR>
nnoremap <leader>u :silent w\|!urlview %<CR>

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
" CheckList Mappings {{{
map <leader>dte :put =strftime(\"%c\")<CR>
noremap <leader>ct :ChecklistToggleCheckbox<cr>
noremap <leader>ce :ChecklistEnableCheckbox<cr>
noremap <leader>cd :ChecklistDisableCheckbox<cr>
noremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <leader>cd :ChecklistDisableCheckbox<cr>
" }}}
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
map <leader>ec :EnableAutoCorrect<CR>
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
nnoremap <leader>gls :tabnew ~/Documents/writing/2020_goals.md<CR>
nnoremap <leader>pb :tabnew ~/.config/polybar/config<CR>
"}}}
" spelling {{{
nnoremap <leader>sp :setlocal spell! spell?<CR>
set complete+=kspell
set thesaurus+=~/moby.txt
nnoremap zn ]s
nnoremap zp [s
nnoremap ze z=
" override color scheme to make bad spellings red.
augroup vimrc
        autocmd!
        autocmd ColorScheme * highlight SpellBad ctermbg=red guibg=red
augroup END
" }}}
" colors {{{
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
" close tags {{{
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.txt'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,txt'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
"let g:closetag_regions = {
                        "\ 'typescript.tsx': 'jsxRegion,tsxRegion',
                        "\ 'javascript.jsx': 'jsxRegion',
                        "\ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>+>'
let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:}"
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

function! Leader_Off()
        autocmd!
        echo "autocmd cleared"
endfunction

map <leader>nln :%s/\([.!?]\)\s\+/\1\ \r/g <CR> \nn

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
"vim-markdown options {{{
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_new_list_item_indent = 0
autocmd filetype markdown noremap <buffer> <C-m> :MarkdownPreview<CR>
autocmd filetype markdown EnableAutocorrect
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd filetype markdown hi SpellBad ctermfg=red guifg=red guibg=black
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80
" }}}
" }}}
" ghost config {{{
let g:ghost_autostart = 1
augroup ghost
        au!
        autocmd BufNewFile,BufRead *stackexchange.com* set filetype=markdown
        autocmd BufNewFile,BufRead *stackoverflow.com* set filetype=markdown
        autocmd BufNewFile,BufRead *www.betterhelp.com* set filetype=html
        autocmd BufNewFile,BufRead *www.betterhelp.com* EnableAutocorrect
        autocmd BufNewFile,BufRead *www.betterhelp.com* setlocal textwidth=80
augroup END

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
nmap gs :GitGutterStageHunk<CR>
nnoremap gu :GitGutterUndoHunk<CR>
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
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
" startify {{{
let g:startify_session_dir = '~/.vim/session'
let g:startify_lists = [
                        \ { 'type': 'files',     'header': ['   MRU']            },
                        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
                        \ { 'type': 'sessions',  'header': ['   Sessions']       },
                        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                        \ { 'type': 'commands',  'header': ['   Commands']       },
                        \ ]
" }}}
" Coc mostly copied from github {{{

autocmd BufRead coc-settings.json syntax match Comment +\/\/.\+$+

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
