" Plugins"{{{

call plug#begin('~/.vim/plugged')

" Enhancements
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'neomake/neomake'
Plug 'pbrisbin/vim-mkdir'
Plug 'rizzatti/dash.vim', { 'on': '<Plug>DashSearch' }
Plug 'tommcdo/vim-exchange'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'

" Language related

" Ruby
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'rails', 'eruby'] }
Plug 'thoughtbot/vim-rspec', { 'for': ['ruby', 'rails', 'eruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rails', 'eruby'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rails', 'eruby'] }

" Javascript
Plug 'elzr/vim-json', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }

" Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Others
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'jsp', 'javascript', 'jsx'] }
Plug 'vim-scripts/SyntaxComplete'

" Colour schemes
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'

call plug#end()
"}}}
" Colour scheme and its settings"{{{

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
"}}}
" Vim settings"{{{

syntax on     " Turn on syntax highlighting

set autoindent     " Keeps same level of indentation of the previous line
set autoread     " Auto-reload buffers when files are changed on disk
set autowrite     " Save on buffer switch
set background=dark     " Assume a dark background
set backspace=indent,eol,start     " More sensible backspace behaviour
set complete+=kspell     " Autocomplete with dictionary words when spell check is on
set cursorline     " Highlight current line
set expandtab     " Tab key will always insert 'softtabstop' amount of space
set foldenable     " Enable folding
set foldmethod=marker     " Fold based on markers
set grepprg=ag     " Use ag as default for grep
" set hidden     " Change default behaviour of opening file of existing buffer
set history=100     " Number of commands to keep in history
set hlsearch     " Highlight search result
set ignorecase     " Ignore case when searching
set incsearch     " Refresh search when entering search term
set infercase     " Smarter case for autocompletion
set laststatus=2     " Show status bar
set lazyredraw     " Redraw window only when we need to
set list     " Actually display extra whitespace symbols
set listchars=tab:»·,trail:·,nbsp:·     " Set extra whitespace symbols
set nobackup nowritebackup noswapfile     " No unnecessary backup files
set nocompatible     " No backwards compatibility
set noerrorbells     " Silent error bell
set nrformats=     " Treat all numerals as decimal
set number     " Show line numbers
set numberwidth=5     " Width of the number column
set relativenumber     " Show relative line numbers
set ruler     " Show line info at the bottom
set shiftwidth=2     " Number of spaces for indents
set showcmd     " Show command at the bottom bar
set smartcase     " Smart case for searching
set so=5     " Number of lines around cursor at the edge of screen
set softtabstop=2     " Number of spaces in tab when editing
set spelllang=en_gb     " Set default spell check to British English
set splitbelow     " New horizontal split opens to the bottom
set splitright     " New vertical split opens to the right
set t_Co=256     " 256 terminal colours
set tabstop=2     " Number of visual spaces per tab
set timeoutlen=500     " Timeout between keystrokes to register command
set undofile     " Set the use of undofiles, which keeps a history of the undos
set undodir=~/.vim/_undo/     " Set the directory to keep the undo files
set wildmenu     " Visual menu for autocomplete

runtime macros/matchit.vim     " Allow vim to match more than just brackets

" A more discrete colour column
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)
"}}}
" Custom mappings"{{{

" Have to use hjkl
nnoremap <Left> :echoe "Use h"<cr>
nnoremap <Right> :echoe "Use l"<cr>
nnoremap <Up> :echoe "Use k"<cr>
nnoremap <Down> :echoe "Use j"<cr>

" Easier esc mapping
imap jk <Esc>
imap kj <Esc>
vmap jk <Esc>
vmap kj <Esc>

" Allow j and k to move down wrapped lines
nnoremap j gj
nnoremap k gk

" Allow ctrl - hotkeys
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-a> <C-o>^
imap <C-e> <C-o>$

" Switching between buffers
nnoremap <C-m> :bn<cr>
nnoremap <C-n> :bp<cr>
nmap <tab> <C-^>

" For switching two characters around and repeatable by .
nnoremap <silent> <Plug>TransposeCharacters xp
      \:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap xp <Plug>TransposeCharacters

" Mapping for Easy Motion
nmap s <Plug>(easymotion-s2)
omap t <Plug>(easymotion-tl)
omap T <Plug>(easymotion-Tl)
omap f <Plug>(easymotion-fl)
omap F <Plug>(easymotion-Fl)
nmap t <Plug>(easymotion-tl)
nmap T <Plug>(easymotion-Tl)
nmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)

" Remap since the function is redundant because of Easymotion
nmap ; :
vmap ; :
" Remap for easier bookmark access
nmap ' `
" Visually select the text that was last edited/pasted
nmap gV `[v`]
" Better start of line config
nmap 0 ^
" Remap to increase number by 1
noremap <C-z> <C-a>
" Copy to system clipboard
vmap <C-c> "*y
" Allow star to go back to the first search term
nmap * *N
" Switching out to terminal
nnoremap <NUL> <C-z>
"}}}
" Leader mappings"{{{

let maplocalleader = "\\"
let mapleader = "\<Space>"
nmap <leader>b :ls<cr>:b
nmap <leader>bd :ls<cr>:bd<C-b><C-b>
nmap <leader>bi :!bundle install<cr>
nmap <leader>c :cclose<cr>
nmap <silent> <leader>d <Plug>DashSearch
nmap <leader>e :w<cr>:call RunLastSpec()<cr>
nmap <leader>g :w<cr>:Gstatus<cr>
nmap <leader>ga :Git add .<cr><cr>
nmap <leader>gd :Gvdiff<cr>
nmap <leader>gl :Gpull origin<Space>
nmap <leader>gp :Gpush<cr>
nmap <silent> <leader>hh :nohlsearch<cr>
" Indent all and return to current line
nmap <leader>ii mzgg=G`z
nmap <leader>ni :!npm install<cr>
nmap <leader>o :CtrlP<cr>
nmap <leader>oo :CtrlPBuffer<cr>
" Sensible pasting from system clipboard
nmap <leader>p o<esc>"*gp
nmap <leader>pi :w<cr>:source $MYVIMRC<cr>:nohlsearch<cr>:PlugUpdate<cr>
nmap <leader>r :w<cr>:call RunNearestSpec()<cr>
nmap <leader>ra :A<cr>
nmap <leader>rc :Econtroller<space>
nmap <leader>re :call RenameFile()<cr>
nmap <leader>rf :Eintegrationtest<space>
nmap <leader>rm :Emodel<space>
nmap <leader>rr :R<cr>
nmap <leader>ru :Eunittest<space>
nmap <leader>rv :Eview<space>
nmap <leader>sn :UltiSnipsEdit<cr>
nmap <leader>so :w<cr>:source $MYVIMRC<cr>:AirlineRefresh<cr>:nohlsearch<cr>
" Going back to the last spelling mistake and choosing the 1st option
nmap <leader>sp mz[s1z=`z
nmap <leader>t :w<cr>:call RunCurrentSpecFile()<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :Bclose<cr>
nmap <leader>wq :wq<cr>
nmap <leader>qw :wq<cr>
" Maximise the quickfix window, useful for reading test errors
nmap <leader>u :copen<cr>:wincmd _<cr>:wincmd \|<cr>
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <leader>vi :e ~/.vimrc<cr>
nmap <leader>y :w<cr>:call RunAllSpecs()<cr>
nmap <leader><leader> :Explore .<cr>

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

nmap <leader>or  :VtrOpenRunner { 'orientation': 'v', 'percentage': 20 }<cr>:VtrSendFile<cr>
nmap <leader>pry :VtrOpenRunner { 'orientation': 'h', 'percentage': 50, 'cmd': 'pry' }<cr>
nmap <leader>irb :VtrOpenRunner { 'orientation': 'h', 'percentage': 50, 'cmd': 'irb' }<cr>
"}}}
" Custom functions"{{{

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Delete all trailing white space on save
function! <SID>StripTrailingWhitespaces()
  " preparation: save last search, and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the search and replace:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
augroup vimrcEx
  autocmd!

  " Enable filetype detection
  filetype plugin indent on

  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =

  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  " Maps K to open vim help for the word under cursor when editing vim files
  autocmd FileType vim setlocal keywordprg=:help

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Ruby path settings
  autocmd FileType ruby setlocal path+=lib/**,spec/**

  " Enable different indentation for java files
  autocmd FileType java set tabstop=8 softtabstop=4 shiftwidth=4

  " Enable different indentation for javascript files
  autocmd FileType javascript set tabstop=4 softtabstop=2 shiftwidth=2

  " Automatically wrap at 80 characters and enable spell check text and markdowns
  autocmd BufRead,BufNewFile *.txt,*.markdown setlocal textwidth=80
  autocmd FileType text,markdown setlocal spell
  autocmd FileType text,markdown hi clear SpellBad
  autocmd FileType text,markdown hi SpellBad cterm=underline
  autocmd FileType text,markdown set formatoptions+=a
  autocmd FileType text,markdown source ~/.vim/abbreviations.vim

  " Enable spellchecking for org files
  autocmd FileType org setlocal spell
  autocmd FileType org hi clear SpellBad
  autocmd FileType org hi SpellBad cterm=underline
  autocmd FileType org source ~/.vim/abbreviations.vim

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit hi clear SpellBad
  autocmd FileType gitcommit hi SpellBad cterm=underline
  autocmd FileType gitcommit set formatoptions+=a
  autocmd FileType gitcommit source ~/.vim/abbreviations.vim

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Tern settings for javascript
  autocmd InsertLeave,InsertEnter,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd FileType javascript nnoremap <silent> <buffer> gd :TernDef<CR>
  autocmd FileType javascript nnoremap <silent> <buffer> K :TernDoc<CR>
  autocmd FileType javascript nnoremap <silent> <buffer> <localleader>K :TernDocBrowse<CR>

  " Types of files to load Emmet
  autocmd FileType html,css,eruby,jsp,javascript,jsx EmmetInstall

  " Ruby completion settings
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Mapping q to close netrw whilst keeping the split open
  autocmd FileType netrw nnoremap q :bp\|bd #<cr>

  " Run NeoMake on read and write operations
  autocmd BufReadPost,BufWritePost * Neomake
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

" Line operations, taken from vim-unimpaired
function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<Plug>unimpairedBlankUp", a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<Plug>unimpairedBlankDown", a:count)
endfunction

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>call <SID>BlankDown(v:count1)<CR>

nmap [<Space> <Plug>unimpairedBlankUp
nmap ]<Space> <Plug>unimpairedBlankDown

function! s:Move(cmd, count, map) abort
  normal! m`
  silent! exe 'move'.a:cmd.a:count
  norm! ``
  silent! call repeat#set("\<Plug>unimpairedMove".a:map, a:count)
endfunction

function! s:MoveSelectionUp(count) abort
  normal! m`
  silent! exe "'<,'>move'<--".a:count
  norm! ``
  silent! call repeat#set("\<Plug>unimpairedMoveSelectionUp", a:count)
endfunction

function! s:MoveSelectionDown(count) abort
  normal! m`
  exe "'<,'>move'>+".a:count
  norm! ``
  silent! call repeat#set("\<Plug>unimpairedMoveSelectionDown", a:count)
endfunction

nnoremap <silent> <Plug>unimpairedMoveUp            :<C-U>call <SID>Move('--',v:count1,'Up')<CR>
nnoremap <silent> <Plug>unimpairedMoveDown          :<C-U>call <SID>Move('+',v:count1,'Down')<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionUp   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionDown :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>

nmap [e <Plug>unimpairedMoveUp
nmap ]e <Plug>unimpairedMoveDown
xmap [e <Plug>unimpairedMoveSelectionUp
xmap ]e <Plug>unimpairedMoveSelectionDown
"}}}
" Plugin settings"{{{

"Airline
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" CtrlP
let g:ctrlp_map = '<Nop>'
let g:ctrlp_max_height = 20

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

" Easy Motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 20
let g:neocomplete#source#word#max_candidates = 20
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 2
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

" Enable heavy omni completion for ruby
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" Netrw settings

" Hide the useless information at the top
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

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

" Vim tmux runner
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 33

let g:vtr_filetype_runner_overrides = {
      \ 'haskell': 'ghci {file}',
      \ 'applescript': 'osascript {file}'
      \ }

" Vim surround
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" Neokmake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" Tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
endif

" Vim javascript libraries syntax
let g:used_javascript_libs = 'jquery,underscore,react,jasmine,flux'

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Vim sexp
let g:sexp_enable_insert_mode_mappings = 1
"}}}
