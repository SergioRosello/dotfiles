execute pathogen#infect()
let mapleader = ","
syntax on
filetype plugin indent on
set nocompatible
set autowrite
set virtualedit=onemore
set history=1000
set autoindent
set relativenumber
set number
" Enable autocompletion
set wildmode=longest,list,full
" Splits open at the bottom and right
set splitbelow splitright
" Save a keypress on changing viewports
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Changes tabs to spaces, used for calabash and ruby
set expandtab
set copyindent
" set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
" End changes tabs to spaces
"
" Start of personal maps for vim
"
" Resize window without the need of Ctrl-w + +
" Directly with <leader> + + or <leader> + -
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" Create a skeleton file for wave issues.
" Change tabs with hotkeys
" Press Ctrl + Shift + h to change to left tab
" Press Ctrl + Shift + l to change to right tab
