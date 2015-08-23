call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

Plug 'scrooloose/nerdtree'

  let NERDTreeShowHidden=1

  silent! nmap <C-p> :NERDTreeToggle<CR>
  silent! map <F12> :NERDTreeFind<CR>

  let g:NERDTreeMapActivateNode="<F12>"
  let g:NERDTreeMapPreview="<F11>"

Plug 'scrooloose/nerdcommenter'
Plug 'plasticboy/vim-markdown'

  let g:vim_markdown_folding_disabled=1

Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }

Plug 'mattn/emmet-vim'

  let g:user_emmet_leader_key='<C-Z>'

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

  au FileType go nmap <leader>i <Plug>(go-info)

Plug 'terryma/vim-expand-region'

  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)

Plug 'editorconfig/editorconfig-vim'

  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'scrooloose/syntastic'

  let g:syntastic_javascript_checkers = ['jshint', 'jscs']

Plug 'mattn/gist-vim'

  let g:gist_clip_command = 'xclip -selection clipboard'
  let g:gist_detect_filetype = 1

Plug 'tpope/vim-surround'
Plug 'mattn/webapi-vim'
Plug 'junegunn/rainbow_parentheses.vim'

  let g:rainbow#pairs = [['(', ')'], ['[', ']']]

  augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
  augroup END

Plug 'tpope/vim-git'
Plug 'tpope/vim-eunuch'
Plug 'mhinz/vim-startify'

  let g:startify_custom_header = map(split(system('fortune | cowsay -f tux'), '\n'), '" ". v:val') + ['','']

Plug 'ZoomWin'

  nnoremap <Leader>o :ZoomWin<CR>

Plug 'grep.vim'
Plug 'moll/vim-node'
Plug 'ekalinin/Dockerfile.vim'
Plug 'kshenoy/vim-signature'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'copypath.vim'
  
  let g:copypath_copy_to_unnamed_register = 1

Plug 'terryma/vim-multiple-cursors'
Plug 'rstacruz/vim-closer'
Plug 'wavded/vim-stylus'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-endwise'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'xero/sourcerer.vim'
Plug 'fmoralesc/vim-pad'

  let g:pad#dir = '/home/benp/vim-pad/'
  let g:pad#window_height = 16

Plug 'geekjuice/vim-mocha'

  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

Plug 'w0ng/vim-hybrid'
Plug 'tommcdo/vim-exchange'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/nginx.vim'
Plug 'leafgarland/typescript-vim'

call plug#end()

syntax on
filetype plugin indent on

" color scheme
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" Needed to make my colorscheme work in tmux
set t_ut=

let mapleader=" "

set number
set numberwidth=5

set ruler
set cursorline

" status line config
set laststatus=2
set statusline=%f\ -
set statusline+=%{fugitive#statusline()}

set scrolljump=8
let html_no_rendering=1
set backspace=2   " make backspace behave
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8
set colorcolumn=80
set incsearch     " use incremental search
set noswapfile    " turn off swapfiles
set autowrite     " automatically :write before running commands
set showcmd       " show incomplete commands

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" set encryption type to something stronger
set cryptmethod=blowfish

" autocomplete with dictionary words when spell check is on
set complete+=kspell

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" keymaps

" get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" kill buffers
noremap <Leader>bd :bd<CR>

" run a command and then paste its output into a vim buffer
noremap <Leader>nex :new<CR>!!

" switch between tabs
noremap <Leader>nt :bn<CR>
noremap <Leader>pv :bp<CR>

" faster than :w
nnoremap <Leader>w :w<CR>

" better and faster than :q
nnoremap <Leader>q :q<CR>

" list buffers
nnoremap <Leader>ls :ls<CR>

" hjkl split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural split directions
set splitbelow
set splitright

" copy and paste to the system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Enter to go the end of a file, Backspace to go to the start, and <N>Enter
" to go to line N
nnoremap <CR> G
nnoremap <BS> gg

" select text you just pasted
noremap gV `[v`]

" sudo a write if you forgot to open a root owned file with sudo
cmap w!! w !sudo tee > /dev/null %

" stop the command popup window from appearing. literally why
map q: :q

" toggle for spell checking
map <F5> :setlocal spell! spelllang=en_gb<CR> 

