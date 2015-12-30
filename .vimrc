let mapleader=" "

if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

Plug 'scrooloose/nerdtree'

  let NERDTreeShowHidden=1

  silent! map <F12> :NERDTreeFind<CR>

  let g:NERDTreeMapActivateNode="<F12>"
  let g:NERDTreeMapPreview="<F11>"
  let g:NERDTreeWinSize=30


Plug 'tpope/vim-commentary'
Plug 'plasticboy/vim-markdown'

  let g:vim_markdown_folding_disabled=1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

  map <c-x><c-k> <Plug>(fzf-complete-word)
  imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <Plug>(fzf-complete-line)

  nnoremap <silent> <C-p> :Files<CR>
  nnoremap <silent> <Leader><Enter> :Buffers<CR>

Plug 'mattn/emmet-vim'

  let g:user_emmet_leader_key='<C-Z>'

Plug 'junegunn/goyo.vim'
Plug 'ervandew/supertab'
Plug 'Lokaltog/vim-easymotion'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-fugitive'

  map <Leader>g :Gstatus<CR>gg<c-n>
  nnoremap <Leader>d :Gdiff<CR>

Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'for': 'go' }

  au FileType go nmap <leader>i <Plug>(go-info)
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <leader>gd <Plug>(go-doc)
  au FileType go nmap <leader>gb <Plug>(go-doc-browser)

Plug 'editorconfig/editorconfig-vim'

  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'scrooloose/syntastic'

  let g:syntastic_go_checkers = ['golint']
  let g:syntastic_jade_checkers = ['jade_lint']
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_javascript_checkers = ['standard']

Plug 'benjaminparnell/vim-switchblade'

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

  let g:gist_clip_command = 'xclip -selection clipboard'
  let g:gist_detect_filetype = 1

Plug 'tpope/vim-surround'
Plug 'junegunn/rainbow_parentheses.vim'

  let g:rainbow#pairs = [['(', ')'], ['[', ']']]

  augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
  augroup END

Plug 'tpope/vim-git'
Plug 'tpope/vim-eunuch'
Plug 'grep.vim'
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
Plug 'geekjuice/vim-spec'

  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

Plug 'tommcdo/vim-exchange'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chrisbra/Colorizer'

  let g:colorizer_auto_filetype='css,html,stylus,jade,less,sass'

Plug 'vim-scripts/nginx.vim'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'gitignore'
Plug 'matze/vim-move'
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Reload the current namespace
au FileType clojure nmap <Leader>r :Require<CR>
" Reload all namespaces
au FileType clojure nmap <Leader>R :Require!<CR>

Plug 'tpope/vim-dispatch'

  map <F5> :Make<CR>
  map <F6> :Make!<CR>
  nnoremap <F9> :Dispatch<CR>

  autocmd FileType javascript let b:dispatch = 'npm test'

Plug 'tpope/vim-classpath', { 'for': ['clojure', 'java'] }
Plug 'paredit.vim'
Plug 'tpope/vim-projectionist'

  " switch to the files alternate file
  nnoremap <F10> :A<CR>

Plug 'shime/vim-livedown'
Plug 'szw/vim-g'
Plug 'garyburd/go-explorer', { 'for': 'go' }
Plug 'derekwyatt/vim-scala'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-flagship'

  autocmd User Flags call Hoist("buffer", "%{ObsessionStatus()}")
  autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")

Plug 'tpope/vim-repeat'
Plug 'ryanss/vim-hackernews'

  nnoremap <Leader>hn :HackerNews<CR>

Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
Plug 'flazz/vim-colorschemes'

call plug#end()

syntax on

" color scheme
let g:seoul256_background = 234
colorscheme seoul256

" Needed to make my colorscheme work in tmux
set t_ut=

set number
set numberwidth=5

set ruler
set cursorline

" for normal people
set mouse=a

" status line config
set laststatus=2
set showtabline=1
set guioptions-=e

set scrolljump=8
set backspace=2   " make backspace behave
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8
set colorcolumn=80
set incsearch     " use incremental search
set ignorecase
set gdefault
set noswapfile    " turn off swapfiles
set showcmd       " show incomplete commands
set shortmess=aIT
set lazyredraw
set visualbell    " no beeps
set autoread      " read in files when they change outside vim

" faster mode switching
set timeoutlen=1000 ttimeoutlen=0

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" autocomplete with dictionary words when spell check is on
set complete+=kspell

augroup vimrcEx
  autocmd!

  au BufWritePost vimrc,.vimrc nested if expand('%') !~ 'fugitive' | source % | endif
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
  autocmd FileType css,scss,sass,stylus setlocal iskeyword+=-

  " Setup default dispatch.vim commands
  autocmd FileType java let b:dispatch = 'javac %'
augroup END

" keymaps

map ; :

" get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" circular window navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

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
nnoremap <Leader>ls :Buffers<CR>

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

" select text you just pasted
noremap gV `[v`]

" sudo a write if you forgot to open a root owned file with sudo
cmap w!! w !sudo tee > /dev/null %

" stop the command popup window from appearing. literally why
map q: :q

" toggle for spell checking
map <F8> :setlocal spell! spelllang=en_gb<CR> 

" resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
