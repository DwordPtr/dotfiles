set nu
imap <C-i> <Esc>
imap jj <Esc>
tnoremap jj <C-\><C-n>

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
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'embear/vim-localvimrc'
Plug 'ludovicchabant/vim-gutentags'
Plug 'simplyzhao/cscope_maps.vim'
Plug 'gburca/vim-logcat'
Plug 'wincent/replay'
Plug 'Houl/repmo-vim'
"local fzf install watch out on new machines
Plug '/usr/local/opt/fzf'
Plug 'DogFooter/FIP.vim'
Plug 'rhysd/vim-clang-format'
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
Plug 'vim-scripts/vim-auto-save'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/csv.vim'
Plug 'vim-scripts/textutil.vim'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive'
Plug 'christoomey/vim-conflicted'
Plug 'hsanson/vim-android'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vimlab/split-term.vim'
Plug 'vim-scripts/vcscommand.vim'
Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'
Plug 'LucHermitte/vim-refactor'
Plug 'mas9612/mdslide.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" colors
Plug 'Dinduks/vim-holylight'
Plug 'wimstefan/vim-artesanal'
Plug 'lifepillar/vim-wwdc17-theme'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'

call plug#end()
"Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.lock     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:mdslide_open_browser_cmd = 'firefox'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|deps/'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|deps/|_build|node_modules',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"double macro hot key
nmap  <Leader>g @q

"allow sb to jump to existing tab
:set swb=usetab

" #Custom leader mappings
"refresh
map <leader>e :e!<CR>
" close
map <leader>cl :q!<CR>
map <leader>tl :tabclose<CR>
" fzf
map <leader>fi :Files<CR>
map <leader>hi :History:<CR>
map <leader>hp :History/<CR>
map <leader>rg :Rg<CR>
map <leader>gf :GFiles<CR>
map <leader>gs :GFiles?<CR>
map <leader>ff :Buffers<CR>
"save
map <leader>ss :w<CR>

"Sessions
let g:session_autosave_silent = 'true'
let g:session_autosave_periodic = 5
let g:session_autoload = 'prompt'
let g:session_autosave = 'yes'
let g:session_default_name = 'default'

"diff settings
set diffopt+=vertical
set diffopt+=iwhite
set diffexpr="\n"
nnoremap <C-h> :History/<CR>

"tabs
noremap <left> :tabprevious<CR>
nnoremap <right> :tabnext<CR>

"terminal toggle 
nnoremap <C-l> :call ChooseTerm("term-slider", 1)<CR>
" Start terminal in current pane
nnoremap <C-o> :call ChooseTerm("term-pane", 0)<CR>
 
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #"
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "vsp"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "vsp"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

"markdown preview options
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
"auto save
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" Teach vim to syntax highlight Vagrantfile as ruby
"
" Install: $HOME/.vim/plugin/vagrant.vim
" Author: Brandon Philips <brandon@ifup.org>

augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
" GitGutter
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk

" set neovim remote
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
" java complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" clipboard
set clipboard=unnamed
set updatetime=500
map <C-n> :NERDTreeToggle<CR>
"map <t> /\| <A-v>
let $Tlist_Ctags_Cmd='/bin/ctags'

tnoremap <Esc> <C-\><C-N>
map <C-c> :let @+ = expand("%:p")<cr>
"cscope
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction
function! s:open_uri()
	let uri= s:get_visual_selection()
	call system('open -a' " .uri")
endfunction
"WIP open highlighted urls from vim
nnoremap <C-h>:call s:open_uri()<CR> 
nmap <C-j> <Plug>GitGutterNextHunk
nmap <C-k> <Plug>GitGutterPrevHunk
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
function! Copy_file_path()
    let @+ = expand("%")
endfunction
autocmd filetype markdown  noremap <buffer> <C-m> :MarkdownPreview<CR>
autocmd filetype crontab setlocal nobackup nowritebackup
autocmd FileType javascript noremap <buffer> <C-h> :call JsBeautify()<CR>
autocmd FileType json noremap <buffer> <C-h> :execute '%!python -m json.tool' | w  <CR>
autocmd FileType elixir noremap <buffer> <C-h>:!mix format<CR>
autocmd FileType python noremap <buffer> <C-h>:Yapf <CR>
let g:clang_format#command='clang-format-3.9'
"let g:clang_format#auto_format='1'

let g:yapf#auto_format_on_insert_leave='0'

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_solarized_bg='dark'
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

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

"NeoSolarized color options
syntax enable 
set background=light
set termguicolors
let g:solarized_termcolors=256
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"
colorscheme NeoSolarized
if has("gui_running")
	unset termguicolors
endif

" Add diagnostic info for https://github.com/itchyny/lightline.vim
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      "\ },
      "\ 'component_function': {
      "\   'cocstatus': 'coc#status'
      "\ },
      "\ }
      "

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
