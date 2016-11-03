" Plugins"{{{
" Automatically install vim-plug and run PlugInstall if vim-plug is not found"{{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif
"}}}
call plug#begin('~/.config/nvim/plugged')
" Enhancements"{{{

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-visual-star-search'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user' | Plug 'lucapette/vim-textobj-underscore'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'pbrisbin/vim-mkdir'
Plug 'tommcdo/vim-exchange'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"}}}
" Others"{{{

Plug 'bling/vim-airline'
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'jsp', 'javascript', 'javascript.jsx'] }
Plug 'sickill/vim-pasta'
Plug 'terryma/vim-smooth-scroll'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'vim-airline/vim-airline-themes'
"}}}
" Language related"{{{

" Ruby"{{{

Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'rails', 'eruby'] }
Plug 'thoughtbot/vim-rspec', { 'for': ['ruby', 'rails', 'eruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rails', 'eruby'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rails', 'eruby'] }
"}}}
" Javascript"{{{

Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
"}}}
" Clojure"{{{

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"}}}
"}}}
" Colour schemes"{{{

Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
"}}}
call plug#end()
"}}}
" Colour scheme and its settings"{{{
colorscheme gruvbox

" A more discrete colour column
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)
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
set grepprg=rg     " Use ag as default for grep
set hidden     " Change default behaviour of opening file of existing buffer
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
set noerrorbells     " Silent error bell
set nrformats=     " Treat all numerals as decimal
set number     " Show line numbers
set numberwidth=3     " Width of the number column
set path+=**     " Add file paths to vim for native 'fuzzy find'
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
set tabstop=2     " Number of visual spaces per tab
set termguicolors     " Enable true colour
set timeoutlen=500     " Timeout between keystrokes to register command
set undodir=~/.config/nvim/_undo/     " Set the directory to keep the undo files
set undofile     " Set the use of undofiles, which keeps a history of the undos
set updatetime=1000     " Time in ms for vim to update/ refresh
set wildmenu     " Visual menu for autocomplete

runtime macros/matchit.vim     " Allow vim to match more than just brackets
"}}}
" Custom mappings"{{{

" Have to use hjkl
nnoremap <Left> :echoe "Use h"<cr>
nnoremap <Right> :echoe "Use l"<cr>
nnoremap <Up> :echoe "Use k"<cr>
nnoremap <Down> :echoe "Use j"<cr>

" Easier esc mapping
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" Allow j and k to move down wrapped lines
nnoremap j gj
nnoremap k gk

" Allow ctrl - hotkeys
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" Switching between buffers
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprevious<cr>
nnoremap <tab> <C-^>

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

" Gitgutter remappings
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" Smooth scroll remappings
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" Terminal mapping to return to previous pane
tnoremap <ESC> <C-\><C-n><C-w><C-p>

" Remap Q for exmode to run macros instead
nnoremap Q @q
" Remap for easier command mode access
nnoremap ; :
vnoremap ; :
" Remap for easier bookmark access
nnoremap ' `
" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" Makes the dot command behave on a Visually selected line
vnoremap . :norm.<CR>
" Better start of line config
nnoremap 0 ^
" Change the behaviour of Y to be more inline with the rest
nnoremap Y y$
" Remap to increase number by 1
noremap <C-z> <C-a>
" Copy to system clipboard
vnoremap <C-c> "*y
" Allow star to go back to the first search term
nnoremap * *N
" Switching out to terminal
nnoremap <NUL> <C-z>
"}}}
" Leader mappings"{{{

let maplocalleader = "\\"
let mapleader = "\<Space>"
nnoremap <leader>a :Ack!<Space>
nnoremap <leader>b :ls<cr>:b
nnoremap <leader>bd :ls<cr>:bd<C-b><C-b>
nnoremap <leader>bi :!bundle install<cr>
nnoremap <leader>c :cclose<cr>
nnoremap <leader>e :w<cr>:call RunLastSpec()<cr>
nnoremap <leader>g :w<cr>:Gstatus<cr>
nnoremap <leader>ga :Git add .<cr><cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gl :Gpull origin<Space>
nnoremap <leader>gp :Gpush<cr>
nnoremap <silent> <leader>hh :nohlsearch<cr>
nmap <leader>ha <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterUndoHunk
nmap <leader>hv <Plug>GitGutterPreviewHunk
" Indent all and return to current line
nnoremap <leader>ii mzgg=G`z
nnoremap <leader>ni :!npm install<cr>
nnoremap <leader>o :Files<cr>
" Sensible pasting from system clipboard
nnoremap <leader>p o<esc>"*gp
nnoremap <leader>pi :w<cr>:source ~/.config/nvim/init.vim<cr>:nohlsearch<cr>:PlugUpdate<cr>
nnoremap <leader>r :w<cr>:call RunNearestSpec()<cr>
nnoremap <leader>ra :A<cr>
nnoremap <leader>rc :Econtroller<space>
nnoremap <leader>re :call RenameFile()<cr>
nnoremap <leader>rf :Eintegrationtest<space>
nnoremap <leader>rm :Emodel<space>
nnoremap <leader>rr :R<cr>
nnoremap <leader>ru :Eunittest<space>
nnoremap <leader>rv :Eview<space>
nnoremap <leader>sn :UltiSnipsEdit<cr>
nnoremap <leader>so :w<cr>:source ~/.config/nvim/init.vim<cr>:AirlineRefresh<cr>:nohlsearch<cr>
" Going back to the last spelling mistake and choosing the 1st option
nnoremap <leader>sp mz[s1z=`z
nnoremap <leader>t :w<cr>:call RunCurrentSpecFile()<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qq :Bclose<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>qw :wq<cr>
" Maximise the quickfix window, useful for reading test errors
nnoremap <leader>u :copen<cr>:wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nnoremap <leader>vi :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>y :w<cr>:call RunAllSpecs()<cr>
nnoremap <leader><leader> :Explore .<cr>

" Zoom in on a vim pane, <C-w>= to re-balance
nnoremap <leader>= :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>- :wincmd =<cr>

" Mappings for the tmux runner plugin
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>sc :VtrSendCommand<cr>
nnoremap <leader>sf :VtrSendFile!<cr>
nnoremap <leader>cr :VtrClearRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <C-a> :VtrSendLinesToRunner<cr>
vnoremap <C-a> :VtrSendLinesToRunner<cr>

nnoremap <leader>or  :VtrOpenRunner { 'orientation': 'v', 'percentage': 20 }<cr>:VtrSendFile<cr>
nnoremap <leader>pry :VtrOpenRunner { 'orientation': 'h', 'percentage': 50, 'cmd': 'pry' }<cr>
nnoremap <leader>irb :VtrOpenRunner { 'orientation': 'h', 'percentage': 50, 'cmd': 'irb' }<cr>
"}}}
" Custom functions"{{{

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Delete all trailing white space on save"{{{
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
"}}}
" Auto commands"{{{
augroup vimrcEx
  autocmd!

  " Enable filetype detection
  filetype plugin indent on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =

  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  " Automatically enter insert mode when entering terminal buffer
  autocmd BufWinEnter,WinEnter term://* startinsert

  " Maps K to open vim help for the word under cursor when editing vim files
  autocmd FileType vim setlocal keywordprg=:help

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable different indentation for java files
  autocmd FileType java set tabstop=8 softtabstop=4 shiftwidth=4

  " Enable different indentation for javascript files
  autocmd FileType javascript set tabstop=4 softtabstop=2 shiftwidth=2

  " Automatically wrap at 80 characters and enable spell check text and markdowns
  autocmd BufRead,BufNewFile *.txt,*.markdown setlocal textwidth=80
  autocmd FileType text,markdown setlocal spell
  autocmd FileType text,markdown hi clear SpellBad
  autocmd FileType text,markdown hi SpellBad cterm=underline
  autocmd FileType text,markdown set formatoptions+=t
  autocmd FileType text,markdown source ~/.config/nvim/abbreviations.vim

  " Enable spellchecking for org files
  autocmd FileType org setlocal spell
  autocmd FileType org hi clear SpellBad
  autocmd FileType org hi SpellBad cterm=underline
  autocmd FileType org source ~/.config/nvim/abbreviations.vim

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit hi clear SpellBad
  autocmd FileType gitcommit hi SpellBad cterm=underline
  autocmd FileType gitcommit set formatoptions+=t
  autocmd FileType gitcommit source ~/.config/nvim/abbreviations.vim

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Tern settings for javascript
  autocmd InsertLeave,InsertEnter,CompleteDone *.js,*.jsx if pumvisible() == 0 | pclose | endif
  autocmd FileType javascript,javascript.jsx set completeopt-=preview
  autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> gd :TernDef<CR>
  autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> K :TernDoc<CR>
  autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> <localleader>K :TernDocBrowse<CR>

  " Types of files to load Emmet
  autocmd FileType html,css,eruby,jsp,javascript,javascript.jsx EmmetInstall

  " Ruby completion settings
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Mapping q to close netrw and help manual whilst keeping the split open
  autocmd FileType netrw nnoremap q :bp\|bd #<cr>
  autocmd FileType help nnoremap q :bd<cr>

  " Run NeoMake on read and write operations
  autocmd BufReadPost,BufWritePost *,js,*.jsx silent! Neomake
augroup END
"}}}
" Rename current file"{{{
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
"}}}
" Don't close window, when deleting a buffer"{{{
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
"}}}
" Things to ignore when tab completing"{{{
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
"}}}
"}}}
" Plugin settings"{{{
"Airline"{{{
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"}}}
" Ack"{{{
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
"}}}
" DelimitMate"{{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
"}}}
" Deoplete"{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
"}}}
" Deoplete ternjs"{{{
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
"}}}
" Dispatch"{{{
let g:rspec_command = "Dispatch rspec {spec}"
"}}}
" Easy motion"{{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1
"}}}
" Emmet"{{{
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
"}}}
" Fzf"{{{

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <C-x><C-k> fzf#complete('cat /usr/share/dict/words')
" Replace the default line completion with fzf-based fuzzy completion
imap <C-x><C-l> <plug>(fzf-complete-line)
" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"}}}
" Gitgutter"{{{
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always=1
"}}}
" Neomake"{{{
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
"}}}
" Netrw settings"{{{

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
"}}}
" Rainbow parentheses"{{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}
" Tern"{{{
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
endif
"}}}
" Tmux navigator"{{{
let g:tmux_navigator_save_on_switch = 2
"}}}
" Ultisnips"{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/UltiSnips', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']
"}}}
" Vim easy align"{{{
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Disabling and foldmethod during alignment
let g:easy_align_bypass_fold = 1
"}}}
" Vim close tag"{{{
let g:closetag_filenames = "*.erb,*.html,*.js,*.jsx"
"}}}
" Vim javascript libraries syntax"{{{
let g:used_javascript_libs = 'jquery,underscore,react,jasmine,flux'
"}}}
" Vim surround"{{{
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
"}}}
" Vim sexp"{{{
let g:sexp_enable_insert_mode_mappings = 1
"}}}
" Vim tmux runner"{{{
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 33

let g:vtr_filetype_runner_overrides = {
      \ 'haskell': 'ghci {file}',
      \ 'applescript': 'osascript {file}'
      \ }
"}}}
"}}}
