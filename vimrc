call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'Shougo/neocomplete'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/tComment'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

Plug 'nanotech/jellybeans.vim'
call plug#end()

runtime macros/matchit.vim

colorscheme jellybeans

syntax on
set autoindent
set autowrite
set backspace=indent,eol,start
set grepprg=ag
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set nobackup nowritebackup noswapfile
set nocompatible
set noerrorbells
set number
set nrformats=alpha
set numberwidth=5
set relativenumber
set ruler
set timeoutlen=500
set showcmd
set showmatch
set smartcase
set smartindent
set so=5
set t_Co=256
set tabstop=2 shiftwidth=2 expandtab

imap jk <Esc>
imap kj <Esc>
imap <C-w> <C-n>
imap <C-q> <C-p>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-d> <Del>
imap <C-e> <C-o>$
imap <C-a> <C-o>^
nmap 0 ^
nmap <C-a> ^
nmap <C-e> $
nmap <C-m> :bn<cr>
nmap <C-n> :bp<cr>
nnoremap <C-z> <C-a>
vmap <C-c> "*y

let mapleader = "\<Space>"
map <leader>b :ls<cr>:b
map <leader>bd :ls<cr>:bd<C-b><C-b>
map <leader>bi :!bundle install<cr>
map <leader>e :w<cr>:call RunLastSpec()<cr>
map <leader>g :w<cr>:Gstatus<cr>
map <leader>gd :Gvdiff<cr>
map <leader>gg :!git open<cr><cr>
map <leader>gp :Gpush<cr>
map <leader>gl :Gpull origin<Space>
map <leader>h :nohlsearch<cr>
map <leader>i mmgg=G`m
map <leader>ni :!npm install<cr>
nnoremap <leader>o :CtrlP<cr>
nnoremap <leader>oo :CtrlPBuffer<cr>
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
nmap <leader>pi :w<cr>:source $MYVIMRC<cr>:PlugUpdate<cr>
map <leader>r :w<cr>:call RunNearestSpec()<cr>
nmap <leader>so :w<cr>:source $MYVIMRC<cr>:AirlineRefresh<cr>:nohlsearch<cr>
map <leader>t :w<cr>:call RunCurrentSpecFile()<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
map <leader>qq :Bclose<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>qw :wq<cr>
nmap <leader>u :copen<cr><C-w>F:cclose<cr>:wincmd _<cr>:wincmd \|<cr>
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <leader>vi :vs ~/.vimrc<cr>
map <leader>y :w<cr>:call RunAllSpecs()<cr>
nnoremap <leader><leader> <c-^>

nnoremap <Left> :echoe "Use h"<cr>
nnoremap <Right> :echoe "Use l"<cr>
nnoremap <Up> :echoe "Use k"<cr>
nnoremap <Down> :echoe "Use j"<cr>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <NUL> <C-z>

" Moving lines
nnoremap ˚ :m .-2<cr>==
nnoremap ∆ :m .+1<cr>==
inoremap ˚ <Esc>:m .-2<cr>==gi
inoremap ∆ <Esc>:m .+1<cr>==gi
vnoremap ˚ :m '<-2<cr>gv=gv
vnoremap ∆ :m '>+1<cr>gv=gv

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>= :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>- :wincmd =<cr>

" Setting paths for ruby
augroup rubypath
autocmd!
autocmd FileType ruby setlocal path+=lib/**,spec/**
augroup END

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
nmap<leader>snip :UltiSnipsEdit<cr>

" Dispatch
let g:rspec_command = "Dispatch rspec {spec}"

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

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

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

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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
map <leader>re :call RenameFile()<cr>

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='\<Space>'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
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
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-y>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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

" vim tmux runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 33

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

let g:vtr_filetype_runner_overrides = {
      \ 'haskell': 'ghci {file}',
      \ 'applescript': 'osascript {file}'
      \ }

" vim surround
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
