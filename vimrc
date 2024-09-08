" General Settings
set nocompatible
set encoding=utf-8
set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set expandtab
set nosmartindent
set autoread
set autochdir
set clipboard+=unnamedplus

"Appearance
syntax enable
set background=dark

"Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

"Navigation
set scrolloff=5
set cursorline

"Editing
set nowrap
set textwidth=80
set colorcolumn=+1

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'                " Status/Tabline
Plug 'vim-airline/vim-airline-themes'         " Airline themes
Plug 'scrooloose/nerdtree'                    " File system explorer
Plug 'tpope/vim-fugitive'                     " Git integration
Plug 'tpope/vim-commentary'                   " Comment/uncomment code
call plug#end()
" Gruvbox 
colorscheme gruvbox

" Airline Configuration
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_a = airline#section#create(['mode'])
call airline#parts#define_minwidth('mode', 10)
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'default'  " f/p/file-name.js
let g:airline#extensions#tabline#formatter = 'jsformatter' " path-to/f
let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js


" Fugitive Configuration
set splitright                     " Open vertical splits to the right
set splitbelow                     " Open horizontal splits below
let g:fugitive_git_executable = 'git'  " Specify git executable path

" Map Leader
let mapleader = ","

" NERDTree Configuration
map <C-n> :NERDTreeToggle<CR>

" Commentary Configuration
nmap <leader>c <Plug>Commentary

" Key Mappings
nnoremap <Leader>c :nohlsearch<CR>      " Clear search highlight
nnoremap <silent> <leader><leader> :source ~/.vim/vimrc<CR>
nnoremap <Leader>s :w<CR>
inoremap <Leader>s <Esc>:w<CR>a
vnoremap <Leader>s <Esc>:w<CR>gv
nnoremap <Leader>b :buffers<CR>:buffer 
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>m :bp<CR>

" Tab Moves
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Terminal Mappings
map <Leader>t :vert term ++close<cr>
tmap <Leader>t <c-w>:vert term ++close<cr>
nnoremap <leader>m :term make<cr>
nnoremap <leader>M :term make clean<cr>
nnoremap <leader>q :bd!<CR>
"nnoremap <leader>q :q<CR> " Some mapping to close the terminal

" Automatically close NERDTree when last file is closed
autocmd bufenter * if (tabpagenr('$') == 1 && winnr('$') == 1 &&
\   exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
