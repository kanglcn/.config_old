" | |                   | |
" | | ____ _ _ __   __ _| | ___ _ __
" | |/ / _` | '_ \ / _` | |/ __| '_ \
" |   < (_| | | | | (_| | | (__| | | |
" |_|\_\__,_|_| |_|\__, |_|\___|_| |_|
"                   __/ |
"                  |___/

" ===
" === Auto load Vim Plug for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === System
" ===

" No compatible with vi
set nocompatible
set hidden "what is the meaning?
" Check file type
" Set proper indentation for different file type
" Enable plugin check file type
" Enable plugin set indentation
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Enable using mouse
set mouse=a

" UTF-8 encoding
set encoding=utf-8

" Better tab
" Expand tab to <SPACE>
set expandtab
" tab width
set tabstop=2
" Set indentation width
set shiftwidth=2
set softtabstop=2
" Enable <SPACE>,<TAB> visible
set list
set listchars=tab:▸\ ,trail:▫

" Set unnamed register as clipboard
" In order to co-work with system CLIPBOARD
set clipboard=unnamed

set updatetime=100

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Set <LEADER> as <SPACE>
let mapleader=" "

" ===
" ===
" ===
nnoremap J 20j
nnoremap K 20k

" ===
" === Main code display
" ===

" Show some message
set number
set relativenumber
set ruler
set wildmenu
set showcmd

" Show two status bar
set laststatus=2

" Prevent auto line split
set wrap
set tw=0

" Limit scroll behavior ensuring at least 5 lines below and beyond cursor
set scrolloff=5

" Search options, highlight...
nnoremap <LEADER><CR> :nohlsearch<CR>
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" Enable syntax highlighting
syntax enable
syntax on

" Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Change directory to current directory
set autochdir

" Code fold
set foldmethod=indent
set foldlevel=99

" ===
" === Split and windows management
" === Default s is disabled here!
" ===
set splitright
set splitbelow
nnoremap s <nop>

" Split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap sj :split<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap sl :vsplit<CR>

" Moving the cursor between windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l

" Resize the windows size
nnoremap <LEADER><up> :res +5<CR>
nnoremap <LEADER><down> :res -5<CR>
nnoremap <LEADER><left> :vertical resize-5<CR>
nnoremap <LEADER><right> :vertical resize+5<CR>

" New tab, same key binding with ranger
nnoremap gn :tabe<CR>

" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'liuchengxu/eleline.vim'
Plug 'ajmwagar/vim-deus'
Plug 'dracula/vim', { 'as': 'dracula' }

" LaTeX
Plug 'lervag/vimtex'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'rhysd/vim-grammarous'
"Plug 'SirVer/ultisnips'
"" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
"
"" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
"
"" Error checking
"Plug 'w0rp/ale'
"
"" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'
"
"" Undo Tree
"Plug 'mbbill/undotree/'
"
"" Snippits
"" Plug 'SirVer/ultisnips'  , { 'for': ['vim-plug', 'python'] }  
"" Plug 'honza/vim-snippets', { 'for': ['vim-plug', 'python'] }
"
"" Other visual enhancement
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'
"Plug 'tmhedberg/SimpylFold'
"
"" Git
"Plug 'rhysd/conflict-marker.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'mhinz/vim-signify'
"Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
"
"" HTML, CSS, JavaScript, PHP, JSON, etc.
"Plug 'elzr/vim-json'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
"Plug 'mattn/emmet-vim'
"
"" Python
"Plug 'vim-scripts/indentpython.vim'
"" Plug 'vim-python/python-syntax', { 'for' :['python', 'vim-plug'] }
"
"" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'
"
"" For general writing
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'
"
"" Bookmarks
"Plug 'kshenoy/vim-signature'
"
"" Other useful utilities
"Plug 'jiangmiao/auto-pairs'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'junegunn/goyo.vim' " distraction free writing mode
"Plug 'ntpeters/vim-better-whitespace', { 'on': ['EnableWhitespace', 'ToggleWhitespace'] } "displays trailing whitespace (after :EnableWhitespace, vim slows down)
"Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
"Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
"Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
"Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
"
"" Dependencies
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'kana/vim-textobj-user'
"Plug 'fadein/vim-FIGlet'

call plug#end()

" Dress
"color deus
colorscheme dracula
"===================================================================
"===coc.nvim
"===================================================================
let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-cmake',
	\ 'coc-diagnostic',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-vimtex',
	\ 'coc-sh',
	\ 'coc-vimlsp']

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-c> coc#refresh()

" Show coc commands.
nnoremap coc :CocCommand<CR>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use <space>m to show manual in preview window.
nnoremap <silent> <LEADER>m :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"ultisnips
"let g:UltiSnipsExpandTrigger="<c>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
