"------------------------------
" Index
"
" General VIM settings
" Visual appearance
" Autocommands
" Terminal related bindings
" Pane related bindings
" Tab related bindings
" Autocompletions
" Functions
" COC plugin settings
"
"------------------------------

" Plugin managment{{{
"
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                      Plugin managment
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
call plug#begin('~/.local/share/nvim/plugged')

" fzf plugin
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Ctrl-p plugin
Plug 'https://github.com/kien/ctrlp.vim'

" Vim repeat
Plug 'https://github.com/tpope/vim-repeat'

" Vim surround
Plug 'https://github.com/tpope/vim-surround'

" Vim fugitive
Plug 'https://github.com/tpope/vim-fugitive'

" Vim sensible
Plug 'https://github.com/tpope/vim-sensible'

" Vim wiki - Wiki documentation and notes
Plug 'https://github.com/vimwiki/vimwiki'

" Ruby linter and configuration
Plug 'https://github.com/vim-ruby/vim-ruby'

" Ruby environmant manager
Plug 'https://github.com/tpope/vim-rbenv'

" COC - Client Implementation of Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
"}}}

" General Vim Settings {{{
"
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                General VIM settings
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

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
" Changes tabs to spaces, used for calabash and ruby
set expandtab
set copyindent
" set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
"set statusline^=%{coc#status()}

" Navigating with guides:
" To navigate a document or a predefined template
" we will assigh the string <++> to be our unique
" identifier. When we press <leader><leader> this
" will look for the next occourence of the previously
" defined string and replace it and enter insert mode
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Change word to UPPER CASE in insert mode
inoremap <c-u> <esc>viwUwi

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P<Paste>

" Open fzf from insert or normal mode
inoremap <silent><leader>o <ESC>:FZF<cr>
nnoremap <silent><leader>o :FZF<cr>
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>l :Lines<cr>

" Enable Ctrl-p to see dotfiles
let g:ctrlp_show_hidden = 1

" Python configuration for nvim (Set in healthcheck)
let g:python_host_prog = '/usr/bin/python2'   " Python 2
let g:python3_host_prog = '/usr/bin/python3'  " Python 3

" Load the search function from file.
so ~/.vim/functions/SearchInProject.vim

" Assign the command SearchInProject to the function SearchInProjectSergio.
command! -nargs=+ SearchInProject :call SearchInProjectSergio(<q-args>, <q-args>)
" }}}

" Visual appearence{{{
"
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                Visual appearence
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

colorscheme onedark
"}}}

" Autocommands {{{

"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                       Autocommands
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

:augroup issues
  " Delete all autocammands from this group.
  " Used to prevent loading the autocommands
  " when sourcing the init.vim file inside vim.
  :autocmd!
  
  " Tells Vim to interpret geojson files as json
  :autocmd BufNewFile,BufFilePre,BufRead *.geojson,*.GeoJson,*.geoJson set filetype=json

  " Tells Vim to interpret issuea and issuei files as markdown
  :autocmd BufNewFile,BufFilePre,BufRead *.md,*.issuea,*.issuei set filetype=markdown

  " Load the skeleton files when we create a issuea or issuei file ending
  :autocmd BufNewFile *.issuea 0r ~/.local/share/nvim/skeletons/skeletonAndroid.issue
  :autocmd BufNewFile *.issuei 0r ~/.local/share/nvim/skeletons/skeletoniOS.issue
  
  " Activate spelcheck to spanish when the files end in issuea or issuei
  :autocmd BufNewFile *.issuea setlocal spell spelllang=es
  :autocmd BufNewFile *.issuei setlocal spell spelllang=es
:augroup END

:augroup ruby
  :autocmd!
  " Create skeleton file for screens.
  :autocmd BufNewFile *_screen.rb 0r ~/.local/share/nvim/skeletons/skeletonScreen.rb
:augroup END

" }}}

" Terminal related bindings {{{

"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                Terminal related bindings                  
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

" Create vertical or horizontal pane with the terminal in the new pane
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" Exit terminal mode (I want it easier)
:tnoremap <Esc> <C-\><C-n>

" Unset number and relativenumber settings when the terminal is started
au TermOpen * setlocal nonumber norelativenumber

" }}}

" Pane related bindings {{{

"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                Pane related bindings
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

" Splits open at the bottom and right
set splitbelow splitright

" Save a keypress on changing viewports
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resize the current window size horizontally
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Edit vim on a vertical pane
nnoremap <leader>cv :vsp ~/.config/nvim/init.vim<cr>

" Source Vim on the recently changed configs
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Fold the code
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Tab related bindings {{{

"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                Tab related bindings
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

" Bindkeys to change tabs easily
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <leader>t :tabnew<CR>
inoremap <leader>t <Esc>:tabnew<CR>

" }}}

" Autocompletions {{{

"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                         autocompletions
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

" MARKDOWN

" Insert inline code in markdown
nmap mc i`<++>` <++><esc>,,
imap <leader>C `<++>` <++>,,

" Insert url in markdown
nnoremap mu o<cr>[<++>](<++>)<esc>0
inoremap <leader>mu <esc>o<cr>[<++>](<++>)<esc>0

" Insert image in markdown
nnoremap mI o<cr>![<++>](./<++>)<esc>0
inoremap <leader>mI <esc>o<cr>![<++>](./<++>)<esc>0

" Insert italic bullet point in markdown
nnoremap mib o* *<++>:* <++><esc>0
inoremap <leader>mib <esc>o* *<++>:* <++><esc>0

" Insert bold bullet point in markdown
nnoremap mbb o* **<++>:** <++><esc>0
inoremap <leader>mbb <esc>o* **<++>:** <++><esc>0

" SYSTEM CLIPBOARD

" Copy the entire file into the system clipboard
nnoremap <leader>yf gg"+yG

" Execute the CreateIssue function
" This uploads the issue file to GitHub
nnoremap <leader>ui :call CreateIssue()<cr>

" Convert the current markdown file into pdf
nnoremap <leader>e :! pandoc % -f markdown -t latex -s -o %:r.pdf<cr>

" Open this file's pdf version with zathura
" The second <cr> is to quit the prompt
nnoremap <leader>v :! zathura %:r.pdf & ; disown<cr><cr>

" Build document with latex
nnoremap <leader>L :CocCommand latex.Build <cr>

" Call MakeAndViewPDF to generate the PDF from the .md file and view it.
nnoremap <leader>E :call MakeAndViewPDF()<cr>

" Correct spell automatically with Vim's first suggestion
let @s = ']s1z=@s'

"}}}

" Functions{{{

"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                         Functions
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

" Upload a issue to Github, based on it's path
" TODO: Output the script's command in a preview-window
function CreateIssue()
  execute "terminal"  "ruby" "/home/sergio/Documents/Wave/Code/createIssue/issueCreator.rb" getcwd() . "/" . bufname("%")
endfunction

function MakeAndViewPDF()
  silent !pandoc % -f markdown -t latex -s -o %:r.pdf
  silent !zathura %:r.pdf & ; disown
endfunction

"}}}

" COC plugin settings{{{
"
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"                         Functions
"-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

" To load and install solargraph if it is not installed previously
let g:coc_global_extensions = ['coc-solargraph']

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gf <Plug>(coc-references)

" Map <tab> to trigger completion and navigate to the next item: >
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" To get correct comment highlighting on JSON files
autocmd FileType json syntax match Comment +\/\/.\+$+

"}}}
