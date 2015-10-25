call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim', { 'on': '<Plug>DashSearch' }
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby'] }
Plug 'Shougo/neocomplete'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rails'] }
Plug 'tpope/vim-repeat'
Plug 'thoughtbot/vim-rspec', { 'for': ['ruby', 'rails'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rails'] }
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'rails'] }
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

Plug 'sjl/badwolf'
call plug#end()

colorscheme badwolf

" Vim settings

runtime macros/matchit.vim     " allow vim to match more than just brackets

syntax on     " turn on syntax highlighting
set autoindent     " keeps same level of indentation of the previous line
set autoread     " Auto-reload buffers when files are changed on disk
set autowrite     " save on buffer switch
set backspace=indent,eol,start     " more sensible backspace behaviour
set complete+=kspell     " Autocomplete with dictionary words when spell check is on
set cursorline     " highlight current line
set expandtab     " tab key will always insert 'softtabstop' amount of space
set grepprg=ag     " use ag as default for grep
set hidden     " change default behaviour of opening file of existing buffer
set history=50     " number of commands to keep in history
set hlsearch     " highlight search result
set ignorecase     " ignore case when searching
set incsearch     " refresh search when entering search term
set laststatus=2     " show status bar
set lazyredraw     " redraw window only when we need to
set nobackup nowritebackup noswapfile     " no unnecessary backup files
set nocompatible     " no backwards compatibility
set noerrorbells     " silent error bell
set number     " show line numbers
set nrformats=alpha     " format numbers such that they increase sensibly
set numberwidth=5     " width of the number column
set relativenumber     " show relative line numbers
set ruler     " show line info at the bottom
set timeoutlen=500     " timeout between keystrokes to register command
set shiftwidth=2     " number of spaces for indents
set showcmd     " show command at the bottom bar
set splitbelow     " new horizontal split opens to the bottom
set splitright     " new vertical split opens to the right
set smartcase     " smart case for searching
set smartindent     " adds another level of indentation in some cases
set so=5     " number of lines around cursor at the edge of screen
set softtabstop=2     " number of spaces in tab when editing
set t_Co=256     " 256 terminal colours
set tabstop=2     " number of visual spaces per tab
set wildmenu     " visual menu for autocomplete

" Custom mappings

" Easier esc mapping
imap jk <Esc>
imap kj <Esc>
vmap jk <Esc>
vmap kj <Esc>
" Easier autocomplete navigation
inoremap <C-w> <C-n>
inoremap <C-q> <C-p>
imap ` <C-x><C-p>
" Allow ctrl - hotkeys
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-a> <C-o>^
imap <C-e> <C-o>$
" Better start of line config
nmap 0 ^
" Switching between buffers
nmap <C-m> :bp<cr>
" Remap to increase number by 1
nnoremap <C-z> <C-a>
" Allow j and k to move down wrapped lines
nnoremap j gj
nnoremap k gk
" Copy to system clipboard
vmap <C-c> "*y
" Switching out to terminal
nnoremap <NUL> <C-z>

" Leader mappings
let mapleader = "\<Space>"
map <leader>b :ls<cr>:b
map <leader>bd :ls<cr>:bd<C-b><C-b>
map <leader>bi :!bundle install<cr>
map <leader>c :cclose<cr>
map <silent> <leader>d <Plug>DashSearch
map <leader>e :w<cr>:call RunLastSpec()<cr>
map <leader>g :w<cr>:Gstatus<cr>
map <leader>gd :Gvdiff<cr>
map <leader>gp :Gpush<cr>
map <leader>gl :Gpull origin<Space>
map <leader>h :nohlsearch<cr>
" Indent all and return to current line
map <leader>i mmgg=G`m
map <leader>ni :!npm install<cr>
map <leader>o :CtrlP<cr>
map <leader>oo :CtrlPBuffer<cr>
" Sensible pasting from system clipboard
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <leader>pi :w<cr>:source $MYVIMRC<cr>:PlugUpdate<cr>
map <leader>r :w<cr>:call RunNearestSpec()<cr>
map <leader>ra :A<cr>
map <leader>rc :Econtroller<space>
map <leader>re :call RenameFile()<cr>
map <leader>rf :Eintegrationtest<space>
map <leader>rm :Emodel<space>
map <leader>rr :R<cr>
map <leader>ru :Eunittest<space>
map <leader>rv :Eview<space>
map <leader>sn :UltiSnipsEdit<cr>
map <leader>so :w<cr>:source $MYVIMRC<cr>:AirlineRefresh<cr>:nohlsearch<cr>
map <leader>t :w<cr>:call RunCurrentSpecFile()<cr>
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>qq :Bclose<cr>
map <leader>wq :wq<cr>
map <leader>qw :wq<cr>
map <leader>u :copen<cr><C-w>F:cclose<cr>:wincmd _<cr>:wincmd \|<cr>
map <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
map <leader>vi :e ~/.vimrc<cr>
map <leader>y :w<cr>:call RunAllSpecs()<cr>
map <leader><leader> :Explore .<cr>

" Zoom in on a vim pane, <C-w>= to re-balance
nnoremap <leader>= :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>- :wincmd =<cr>

" Mappings for the tmux runner plugin
nmap <leader>va :VtrAttachToPane<cr>
nmap <leader>sc :VtrSendCommand<cr>
nmap <leader>sf :VtrSendFile!<cr>
nmap <leader>cr :VtrClearRunner<cr>
nmap <leader>kr :VtrKillRunner<cr>
nmap <C-a> :VtrSendLinesToRunner<cr>
vmap <C-a> :VtrSendLinesToRunner<cr>

nmap <leader>or  :VtrOpenRunner { 'orientation': 'h', 'percentage': 50 }<cr>
nmap <leader>pry :VtrOpenRunner { 'orientation': 'h', 'percentage': 50, 'cmd': 'pry' }<cr>
nmap <leader>irb :VtrOpenRunner { 'orientation': 'h', 'percentage': 50, 'cmd': 'irb' }<cr>

" Have to use hjkl
nnoremap <Left> :echoe "Use h"<cr>
nnoremap <Right> :echoe "Use l"<cr>
nnoremap <Up> :echoe "Use k"<cr>
nnoremap <Down> :echoe "Use j"<cr>

" Moving lines
nnoremap ˚ :m .-2<cr>==
nnoremap ∆ :m .+1<cr>==
inoremap ˚ <Esc>:m .-2<cr>==gi
inoremap ∆ <Esc>:m .+1<cr>==gi
vnoremap ˚ :m '<-2<cr>gv=gv
vnoremap ∆ :m '>+1<cr>gv=gv

" Ruby settings

" Setting paths for ruby
augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal path+=lib/**,spec/**
augroup END

" Custom functions

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Delete all trailing white space on save
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
augroup vimrcEx
  autocmd!

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

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

" Things to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=.env
set wildignore+=.env[0-9]+
set wildignore+=.env-pypy
set wildignore+=.git,.gitkeep
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=*DS_Store*
set wildignore+=.sass-cache/
set wildignore+=__pycache__/
set wildignore+=.webassets-cache/
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.tox/**
set wildignore+=.idea/**
set wildignore+=.vagrant/**
set wildignore+=.coverage/**
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Plugin settings

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" CtrlP
let g:ctrlp_map = '<Nop>'
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 100

" Faster CtrlP search
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" Dispatch
let g:rspec_command = "Dispatch rspec {spec}"

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall
let g:user_emmet_leader_key=','

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 10
let g:neocomplete#source#word#max_candidates = 10
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Enable heavy omni completion for ruby
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplete#force_omni_input_patterns.eruby = '[^. *\t]\.\w*\|\h\w*::'

" Netrw settings

" Mapping q to close netrw whilst keeping the split open
autocmd FileType netrw nnoremap q :bp\|bd #<cr>

let g:netrw_banner=0

" Things to ignore when when using netrw
let g:netrw_list_hide='\.o,\.obj,*\~,\.pyc,'
let g:netrw_list_hide.='\.env,'
let g:netrw_list_hide.='\.env[0-9].,'
let g:netrw_list_hide.='\.env-pypy,'
let g:netrw_list_hide.='\.git,'
let g:netrw_list_hide.='\.gitkeep,'
let g:netrw_list_hide.='\.vagrant,'
let g:netrw_list_hide.='\.tmp,'
let g:netrw_list_hide.='\.coverage$,'
let g:netrw_list_hide.='\.DS_Store,'
let g:netrw_list_hide.='__pycache__,'
let g:netrw_list_hide.='\.webassets-cache/,'
let g:netrw_list_hide.='\.sass-cache/,'
let g:netrw_list_hide.='\.ropeproject/,'
let g:netrw_list_hide.='vendor/rails/,'
let g:netrw_list_hide.='vendor/cache/,'
let g:netrw_list_hide.='\.gem,'
let g:netrw_list_hide.='\.ropeproject/,'
let g:netrw_list_hide.='\.coverage/,'
let g:netrw_list_hide.='log/,'
let g:netrw_list_hide.='tmp/,'
let g:netrw_list_hide.='\.tox/,'
let g:netrw_list_hide.='\.idea/,'
let g:netrw_list_hide.='\.egg,\.egg-info,'
let g:netrw_list_hide.='\.png,\.jpg,\.gif,'
let g:netrw_list_hide.='\.so,\.swp,\.zip,/\.Trash/,\.pdf,\.dmg,/Library/,/\.rbenv/,'
let g:netrw_list_hide.='*/\.nx/**,*\.app'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

" vim tmux runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 33

let g:vtr_filetype_runner_overrides = {
      \ 'haskell': 'ghci {file}',
      \ 'applescript': 'osascript {file}'
      \ }

" vim surround
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
