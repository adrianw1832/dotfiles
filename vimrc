call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer'] }
Plug 'rizzatti/dash.vim', { 'on': '<Plug>DashSearch' }
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby'] }
Plug 'Shougo/neocomplete'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
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
Plug 'edkolev/tmuxline.vim'

Plug 'sjl/badwolf'
call plug#end()

colorscheme badwolf

runtime macros/matchit.vim     " allow vim to match more than just brackets

syntax on     " turn on syntax highlighting
set autoindent     " keeps same level of indentation of the previous line
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

" easier esc mapping
imap jk <Esc>
imap kj <Esc>
vmap jk <Esc>
vmap kj <Esc>
" easier autocomplete navigation
imap <C-w> <C-n>
imap <C-q> <C-p>
" allow ctrl - hotkeys
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-a> <C-o>^
imap <C-e> <C-o>$
nmap <C-a> ^
nmap <C-e> $
" switching between buffers
nmap <C-m> :bn<cr>
nmap <C-n> :bp<cr>
" remap to increase number by 1
nnoremap <C-z> <C-a>
" switch between previous buffer
nnoremap <tab> <c-^>
" allow j and k to move down wrapped lines
nnoremap j gj
nnoremap k gk
" copy to system clipboard
vmap <C-c> "*y
" Switching out to terminal
nnoremap <NUL> <C-z>

" leader mappings
let mapleader = "\<Space>"
map <leader>b :ls<cr>:b
map <leader>bd :ls<cr>:bd<C-b><C-b>
map <leader>bi :!bundle install<cr>
map <leader>c :cclose<cr>
map <silent> <leader>d <Plug>DashSearch
" delete all trailing white spaces
map <leader>dw :%s/\s\+$//<cr>:w<cr>
map <leader>e :w<cr>:call RunLastSpec()<cr>
map <leader>g :w<cr>:Gstatus<cr>
map <leader>gd :Gvdiff<cr>
map <leader>gg :!git open<cr><cr>
map <leader>gp :Gpush<cr>
map <leader>gl :Gpull origin<Space>
map <leader>h :nohlsearch<cr>
" indent all and return to current line
map <leader>i mmgg=G`m
map <leader>ni :!npm install<cr>
map <leader>o :CtrlP<cr>
map <leader>oo :CtrlPBuffer<cr>
" sensible pasting from system clipboard
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

nmap <leader>va :VtrAttachToPane<cr>
nmap <leader>sc :VtrSendCommand<cr>
nmap <leader>sf :VtrSendFile!<cr>
nmap <leader>cr :VtrClearRunner<cr>
nmap <leader>kr :VtrKillRunner<cr>
nmap <C-f> :VtrSendLinesToRunner<cr>
vmap <C-f> :VtrSendLinesToRunner<cr>

nmap <leader>or:VtrOpenRunner { 'orientation': 'h', 'percentage': 50 }<cr>
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

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Zoom in on a vim pane, <C-w>= to re-balance
nnoremap <leader>= :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>- :wincmd =<cr>

" Setting paths for ruby
augroup rubypath
autocmd!
autocmd FileType ruby setlocal path+=lib/**,spec/**
augroup END

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

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

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

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

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

" Dispatch
let g:rspec_command = "Dispatch rspec {spec}"

" CtrlP
set wildignore+=*.png,*.jpg,*.gif,*.jpeg,*.gem
set wildignore+=*DS_Store*,*sass-cahce*
set wildignore+=*.o,*.obj,.git,bower_components,node_modules,_site,*.class,*.zip,*.aux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Faster CtrlP search
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

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
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
