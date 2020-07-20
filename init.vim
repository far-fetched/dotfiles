call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'pangloss/vim-javascript'
Plug 'skielbasa/vim-material-monokai'
Plug 'scrooloose/nerdcommenter'
Plug 'dkprice/vim-easygrep'
Plug 'elixir-editors/vim-elixir'
Plug 'sukima/vim-javascript-imports'
Plug 'sukima/vim-ember-imports'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/gv.vim'
Plug 'merlinrebrovic/focus.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-projectionist'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-ember',
  \ 'coc-eslint',
  \ 'coc-tailwindcss',
  \ 'coc-emmet'
\ ]


" coc starts
" workspaceworkspace" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

 "CoC mapping for next / previous error
nnoremap <silent> <S-Right> :call CocAction('diagnosticNext')<CR>
nnoremap <silent> <S-Left> :call CocAction('diagnosticPrevious')<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc ends

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set termguicolors
colorscheme material-monokai

" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

set noeb vb t_vb=

let g:mustache_abbreviations = 1

" let g:EasyGrepDefaultUserPattern="app/**/*.*"
let g:EasyGrepSearchCurrentBufferDir = 0
" let g:EasyGrepMode=3

let g:EasyGrepCommand="grep"
let g:EasyGrepRoot="repository"
let g:EasyGrepRecursive = 1
let g:EasyGrepFilesToExclude = "vendor,tmp,node_modules,.idea,bower_components,dist,recordings,temp-tests,tags"
nnoremap <leader>ev :vsp $MYVIMRC<CR> " type,evto edit the Vimrc

let g:vim_javascript_imports_map = '<Leader>e'

let g:focus_use_default_mapping = 0
nmap <leader>f <Plug>FocusModeToggle

" airline theme
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" startify bookmark
let g:startify_bookmarks = [ {'c': '~/.vimrc'} ]


