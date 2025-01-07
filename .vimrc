syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set hidden
set ignorecase
set smartcase
set noesckeys
set noswapfile
set incsearch
set hlsearch
set autoindent
set autochdir
colorscheme koehler
map gf :e <cfile><CR>
map % :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
map <esc><esc> :noh<CR>
hi ModeMsg cterm=bold ctermbg=NONE ctermfg=NONE
