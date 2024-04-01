call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'ludovicchabant/vim-gutentags'
Plug 'pangloss/vim-javascript'
Plug 'mhartington/oceanic-next'
Plug 'rebelot/kanagawa.nvim'
Plug 'preservim/nerdcommenter'
Plug 'sukima/vim-javascript-imports'
Plug 'sukima/vim-ember-imports'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'dense-analysis/ale'
Plug 'andymass/vim-matchup'
Plug 'jparise/vim-graphql'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'wellle/context.vim'
Plug 'elixir-editors/vim-elixir'

call plug#end()

" grepper
xmap gs <plug>(GrepperOperator)
nnoremap <leader>gs :Grepper -tool git<cr>
nnoremap <leader>gb :Grepper -tool git -buffer -noopen<cr>
let g:grepper               = {}
let g:grepper.tools         = ['git']
let g:grepper.highlight     = 1


" copy to clipboard
set clipboard=unnamedplus

" search
set ignorecase
set smartcase
set scrolloff=5

" line numbers
set number

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

"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

" highlight partial search
set hlsearch

" Import js
let g:vim_javascript_imports_map = '<Leader>e'

" Theme
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme OceanicNext

"if has("gui_running") || &t_Co == 88 || &t_Co == 256
  "let s:low_color = 0
"else
  "let s:low_color = 1
"endif
"colorscheme kanagawa

"vim.cmd("colorscheme kanagawa")

" Ale
nmap <silent> <S-left> <Plug>(ale_previous_wrap)
nmap <silent> <S-right> <Plug>(ale_next_wrap)
nnoremap <Leader>p :ALEFix prettier<CR>
nnoremap <Leader>r :ALEFix rubocop<CR>
nnoremap <Leader><Leader>r :!rubocop -A %<CR>
nnoremap <Leader>o :ALEFix mix_format<CR>

let g:ale_set_highlights = 0

let g:ale_linters = {
\   'graphql': ['gqlint'],
\   'html': ['embertemplatelint'],
\   'elixir': ['credo', 'elixir-ls'],
\}
" Required, tell ALE where to find Elixir LS
let g:ale_elixir_elixir_ls_release = expand("/home/pjoter/Dokumenty/elixir/elixir-ls/rel")
" Optional, you can disable Dialyzer with this setting
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}
" Optional, configure as-you-type completions
set completeopt=menu,menuone,popup,noselect,noinsert
let g:ale_completion_enabled = 1

" github open
nnoremap <Leader>g :OpenGithubFile<CR>

" vim context blacklist

let g:context_filetype_blacklist = ['html.handlebars']

" cursor change when write
:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline

"set working backspace
set backspace=indent,eol,start

"show command line in the visual mode
set showcmd

"set swap files directory
set swapfile
set dir=~/tmp

