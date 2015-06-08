" vim-plug

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'ervandew/supertab'
Plug 'Lokaltog/vim-easymotion'
Plug 'juvenn/mustache.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'terryma/vim-expand-region'

call plug#end()

syntax on
filetype plugin indent on

" color scheme
set background=dark
colo seoul256

" Needed to make my colorscheme work in tmux
set t_ut=

" turn line numbering on
set number

" map leader
let mapleader=" "

" autoindent on when programming
set noai

" turn on line numbers
set number

" turn on ruler
set noruler
set nocursorline

" status line config
set laststatus=2
set statusline=%f\ -
set statusline+=%{fugitive#statusline()}

let loaded_matchparen=1
set noshowmatch
set nocursorcolumn
set scrolljump=8
let html_no_rendering=1

set bs=2

" set tabs to 4 spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8
set colorcolumn=80

" show invisible characters
"set list set listchars=eol:¬

" turn off swapfiles
set noswapfile

" show incomplete commands
set showcmd

" set encryption type to something stronger
set cryptmethod=blowfish

" keymaps
cmap w!! w !sudo tree > dev/null %

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F12> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F12>"
let g:NERDTreeMapPreview="<F11>"

" emmet keymaps
let g:user_emmet_leader_key='<C-Z>'

" turn off markdown folding. literally what.
let g:vim_markdown_folding_disabled=1

au FileType go nmap <leader>i <Plug>(go-info)

" Auto remove whitespace on write
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre   * :call TrimWhiteSpace()
autocmd FileAppendPre  * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre    * :call TrimWhiteSpace()

