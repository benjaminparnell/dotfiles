let mapleader=" "

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
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

Plug 'junegunn/vim-journal'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

  if has('nvim')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
  endif

  map <c-x><c-k> <Plug>(fzf-complete-word)
  imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <Plug>(fzf-complete-line)

  nnoremap <silent> <C-p> :Files<CR>
  nnoremap <silent> <Leader><Enter> :Buffers<CR>
  nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

Plug 'mattn/emmet-vim'

  let g:user_emmet_leader_key='<C-Z>'

Plug 'junegunn/goyo.vim'
Plug 'Shougo/deoplete.nvim'

  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#disable_auto_complete = 1
  inoremap <silent><expr> <C-x><C-o>
    \ pumvisible() ? "\<C-n>" :
    \ deoplete#mappings#manual_complete()

Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-fugitive'

  map <Leader>g :Gstatus<CR>gg<c-n>
  nnoremap <Leader>d :Gdiff<CR>

Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
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
  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = '-std=c++11 -pthread'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1

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
Plug 'ekalinin/Dockerfile.vim'
Plug 'copypath.vim'

  let g:copypath_copy_to_unnamed_register = 1

Plug 'terryma/vim-multiple-cursors'
Plug 'rstacruz/vim-closer'
Plug 'wavded/vim-stylus'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-endwise'
Plug 'geekjuice/vim-spec', { 'for': ['javascript', 'ruby'] }

  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

Plug 'moofish32/vim-ex_test'

  au FileType elixir map <Leader>t :call RunCurrentTestFile()<CR>
  au FileType elixir map <Leader>s :call RunNearestTest()<CR>
  au FileType elixir map <Leader>l :call RunLastTest()<CR>
  au FileType elixir map <Leader>a :call RunAllTests()<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'chrisbra/Colorizer'

  let g:colorizer_auto_filetype='css,html,stylus,jade,less,sass'

Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'gitignore'
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

  au FileType clojure nnoremap ` :call PareditToggle()<CR>

Plug 'tpope/vim-projectionist'

  " switch to the files alternate file
  nnoremap <F10> :A<CR>

Plug 'shime/vim-livedown'
Plug 'szw/vim-g'
Plug 'derekwyatt/vim-scala'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-flagship'

  autocmd User Flags call Hoist("buffer", "%{ObsessionStatus()}")
  autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")

Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
Plug 'balaclark/cdprojectroot.vim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

call plug#end()

syntax on

" color scheme
let g:seoul256_background = 234
colorscheme seoul256

" persist undos
set undofile
set undodir=~/.vim/undodir

set ruler
set cursorline
set mouse=a
set showtabline=1
set nu
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set visualbell
set backspace=indent,eol,start
set shortmess=aIT
set colorcolumn=80
set hidden
set ignorecase smartcase
set wildmenu
set wildmode=full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set hlsearch
set incsearch
set noswapfile
set autoread
set timeoutlen=500
set ttimeoutlen=0
set list listchars=tab:»·,trail:·,nbsp:·
set complete+=kspell
set splitbelow
set splitright
set nostartofline

augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

augroup highligh_follows_vim
    autocmd!
    autocmd FocusGained * set cursorline
    autocmd FocusLost * set nocursorline
augroup END

augroup vimrcEx
  autocmd!

  au BufWritePost vimrc,.vimrc,init.vim nested if expand('%') !~ 'fugitive' | source % | endif
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

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" list buffers
nnoremap <Leader>ls :Buffers<CR>

" make y behave like other capitals
nnoremap Y y$

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

" functions

" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" ----------------------------------------------------------------------------
" Help in new tabs
" ----------------------------------------------------------------------------
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction

augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt call s:helptab()
augroup END

" ----------------------------------------------------------------------------
" gv.vim
" ----------------------------------------------------------------------------
function! s:gv_expand()
  let line = getline('.')
  GV --name-status
  call search('\V'.line, 'c')
  normal! zz
endfunction

autocmd! FileType GV nnoremap <buffer> <silent> + :call <sid>gv_expand()<cr>

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  " hi NonText ctermfg=101
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>
