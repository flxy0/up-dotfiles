set nocompatible               " Be iMproved
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-grepper'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Colors
Plug 'joshdick/onedark.vim'

" C/C++
Plug 'vim-scripts/c.vim'

" PY
Plug 'davidhalter/jedi-vim'

" JS
Plug 'jelera/vim-javascript-syntax'

" HTML
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" Add plugins to &runtimepath
call plug#end()

"" Setup
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set backspace=indent,eol,start

set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=2

let mapleader=' '

set hidden

set hlsearch
set incsearch
set ignorecase
set smartcase

set bomb
set binary

set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/usr/local/bin/zsh

set mouse=a

" enable deoplete
let g:deoplete#enable_at_startup = 1

"" Looks
syntax on
set ruler
set cursorline
set colorcolumn=120

" LineNrs
set number
set relativenumber
nnoremap <leader><F2> :set rnu!<CR>
highlight LineNr  cterm=NONE ctermfg=8 ctermbg=NONE
highlight CursorLineNr  cterm=NONE ctermfg=7 ctermbg=NONE
highlight Pmenu ctermbg=15 ctermfg=1
highlight PmenuSel ctermbg=12 ctermfg=3
highlight MatchParen ctermbg=4 ctermfg=0

" IndentLine
let g:indentLine_faster=1
let g:indentLine_char = '¦'

set termguicolors
colorscheme onedark
set laststatus=2

set modeline
set modelines=10

set title
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Airline
let g:airline_theme = 'onedark'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"" Nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <C-n> :NERDTreeToggle<CR>
noremap <F3> :NERDTreeToggle<CR>

"" Grep
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

""""" Mappings
cmap w!! w !sudo tee > /dev/null %
imap <Leader><Leader> <ESC>
tnoremap <Esc> <c-\><c-n>
nnoremap <leader>t :terminal<CR>
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore '+ g:ctrlp_custom_ignore +' -g ""'
endif

"" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" C/P
set clipboard=unnamedplus
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
noremap <leader>c :bdelete<CR>
noremap <leader>bd :bd<CR>

"" Git
noremap <leader>gd :Gdiff<CR>
noremap <leader>gb :Gblame<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-w>+ :res +10<CR>
noremap <C-w>- :res -10<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Commentary maps - Vmode only
vnoremap c :Commentary<CR>
noremap <C-_> :Commentary<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shhttps://pbs.twimg.com/media/CjTYWLqUgAAvtVE.jpgiftwidth=4 tabstop=8 colorcolumn=120
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
  autocmd FileType python  nnoremap <leader>pu Oimport pudb; pudb.set_trace() # BREAKPOINT<ESC><CR>
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" " Rust
let g:racer_cmd = "$HOME/.cargo/bin/racer_cmd"
let $RUST_SRC_PATH="$HOME/"

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_post_args='--ignore=W391'
let g:syntastic_javascript_checkers=['eslint']

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" vim-javascript
let g:jsx_ext_required = 0 " Allow jsx syntax highlighting in normal js files
let g:javascript_enable_domhtmlcss = 1
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

" vim-airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0""
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:tmuxline_powerline_seperators = 0
let g:tmuxline_separators = {
	\ 'left' : '',
	\ 'left_alt' : '>',
	\ 'right' : '',
	\ 'right_alt' : '<',
	\ 'space' : ' ', }

let g:airline_left_alt_sep = '>'
let g:airline_right_alt_sep = '<'
