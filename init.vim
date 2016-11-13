" Plugins"{{{
" Automatically install vim-plug and run PlugInstall if vim-plug is not found"{{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
"}}}
call plug#begin('~/.config/nvim/plugged')
" Enhancements"{{{

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-visual-star-search'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-runner'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user' | Plug 'lucapette/vim-textobj-underscore'
Plug 'luochen1990/rainbow'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'sickill/vim-pasta'
Plug 'tommcdo/vim-exchange'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'
"}}}
" Others"{{{

Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'jsp', 'javascript', 'javascript.jsx'] }
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-smooth-scroll'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'vim-airline/vim-airline'
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
call plug#end()
"}}}
" Vim settings"{{{

colorscheme gruvbox

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Block shape cursor in normal, pipe in insert
set background=dark " Assume a dark background
set complete+=kspell " Autocomplete with dictionary words when spell check is on
set cursorline " Highlight current line
set diffopt+=vertical " Vertical default for diff panes
set expandtab " Tab key will always insert 'softtabstop' amount of space
set foldenable " Enable folding
set foldmethod=marker " Fold based on markers
set grepprg=rg " Use ripgrep as default for grep
set hidden " Change default behaviour of opening file of existing buffer
set ignorecase " Ignore case when searching
set infercase " Smarter case for autocompletion
set lazyredraw " Redraw window only when we need to
set list " Actually display extra whitespace symbols
set listchars=tab:»·,trail:·,nbsp:· " Set extra whitespace symbols
set nobackup nowritebackup noswapfile " No unnecessary backup files
set noerrorbells " Silent error bell
set noshowmode " Let vim airline handle the mode display
set nrformats= " Treat all numerals as decimal
set number " Show line numbers
set numberwidth=3 " Width of the number column
set path+=** " Add file paths to vim for native 'fuzzy find'
set relativenumber " Show relative line numbers
set ruler " Show line info at the bottom
set shiftwidth=2 " Number of spaces for indents
set showcmd " Show command at the bottom bar
set smartcase " Smart case for searching
set so=5 " Number of lines around cursor at the edge of screen
set softtabstop=2 " Number of spaces in tab when editing
set spelllang=en_gb " Set default spell check to British English
set splitbelow " New horizontal split opens to the bottom
set splitright " New vertical split opens to the right
set tabstop=2 " Number of visual spaces per tab
set timeoutlen=500 " Timeout between keystrokes to register command
set undofile " Set the use of undofiles, which keeps a history of the undos
set updatetime=1000 " Time in ms for vim to update/ refresh
"}}}
" Custom mappings"{{{

" Easier esc mapping
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" Easier navigating between panes
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-\> <C-w>p

" Allow j and k to move down wrapped lines
nnoremap j gj
nnoremap k gk

" Switching between buffers
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprevious<cr>
nnoremap <tab> <C-^>

" For switching two characters around and repeatable by .
nnoremap <silent> <Plug>TransposeCharacters xp
      \:call repeat#set("\<Plug>TransposeCharacters")<cr>
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
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<cr>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<cr>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<cr>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<cr>

" Terminal mapping to return to previous pane
tnoremap <ESC> <C-\><C-n><C-w><C-p>

" Allow emcas style keys in insert mode
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Delete>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-h> <BS>

" Allow emcas style keys in command line mode
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-d>  <Delete>
cnoremap <C-e>  <End>
cnoremap <C-f>  <Right>
cnoremap <C-h>  <BS>

" Smarter history navigation with up and down arrows
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" Remap Q for exmode to run macros instead
nnoremap Q @q
" Remap for easier command mode access
nnoremap ; :
vnoremap ; :
" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" Makes the dot command behave on a Visually selected line
vnoremap . :norm.<cr>
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
vnoremap * *N
" Switching out to terminal
nnoremap <NUL> <C-z>
"}}}
" Leader mappings"{{{

let maplocalleader = "\\"
let mapleader = "\<space>"
nnoremap <leader>a :Ack!<space>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bi :!bundle install<cr>
nnoremap <silent> <leader>c :cclose<cr>
nnoremap <leader>e :w<cr>:TestLast<cr>
nnoremap <leader>g :w<cr>:Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <silent> <leader>h :nohlsearch<cr>
nmap <leader>ha <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterUndoHunk
nmap <leader>hv <Plug>GitGutterPreviewHunk
nnoremap <leader>i mzgg=G`z
" Edit any register(" by default) in the command line window, press enter to finish
nnoremap <silent> <leader>m :<c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <leader>ni :!npm install<cr>
nnoremap <leader>o :Files<cr>
nnoremap <leader>p :put =nr2char(10)<cr>"*p=`]']
nnoremap <leader>P a<space><esc>"*gp
nnoremap <leader>pi :w<cr>:source $MYVIMRC<cr>:nohlsearch<cr>:PlugUpgrade<cr>:PlugUpdate<cr>
nnoremap <leader>r :w<cr>:TestNearest<cr>
nnoremap <leader>ra :A<cr>
nnoremap <leader>rc :Econtroller<space>
nnoremap <leader>rf :Eintegrationtest<space>
nnoremap <leader>rm :Emodel<space>
nnoremap <leader>rr :R<cr>
nnoremap <leader>ru :Eunittest<space>
nnoremap <leader>rv :Eview<space>
nnoremap <silent> <leader>sn :UltiSnipsEdit<cr>
nnoremap <leader>so :w<cr>:source $MYVIMRC<cr>:AirlineRefresh<cr>:nohlsearch<cr>:echoe "Vimrc sourced!"<cr>
" Going back to the last spelling mistake and choosing the 1st option
nnoremap <silent> <leader>sp mz[s1z=`z
nnoremap <leader>t :w<cr>:TestFile<cr>
nnoremap <leader>T :TestVisit<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qq :Bclose<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>qw :wq<cr>
" Maximise the quickfix window, useful for reading test errors
nnoremap <leader>u :copen<cr>:wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nnoremap <leader>vi :e $MYVIMRC<cr>
nnoremap <leader>y :w<cr>:TestSuite<cr>
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
" Don't close window, when deleting a buffer"{{{
command! Bclose call <SID>BufcloseCloseIt()
function! s:BufcloseCloseIt()
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
" Delete all trailing white space on save"{{{
function! s:StripTrailingWhitespaces()
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
" Create directory on save if it doesn't exist"{{{
function! s:CreateNonExistantDirectory()
  let dir = expand('%:p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction
"}}}
"}}}
" Auto commands"{{{
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Run NeoMake on read and write operations
  autocmd BufReadPost,BufWritePost * Neomake

  autocmd BufWritePre * :call s:StripTrailingWhitespaces()
  autocmd BufWritePre * :call s:CreateNonExistantDirectory()

  autocmd InsertLeave,BufWinEnter,WinEnter * set cursorline
  autocmd InsertEnter,BufWinLeave,WinLeave * set nocursorline

  " Automatically enter insert mode when entering terminal buffer
  autocmd BufWinEnter,WinEnter term://* startinsert

  " Automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =

  " Maps K to open vim help for the word under cursor when editing vim files
  autocmd FileType vim setlocal keywordprg=:help

  " Enable different indentation for language specific files
  autocmd FileType java       setlocal tabstop=8 softtabstop=4 shiftwidth=4
  autocmd FileType javascript setlocal tabstop=4 softtabstop=2 shiftwidth=2

  " Automatically wrap at 80 characters and enable spell check text and markdowns
  autocmd FileType text,markdown setlocal textwidth=80
  autocmd FileType text,markdown setlocal spell
  autocmd FileType text,markdown setlocal formatoptions+=t
  autocmd FileType text,markdown source ~/.config/nvim/abbreviations.vim

  " Enable spellchecking for org files
  autocmd FileType org setlocal spell
  autocmd FileType org source ~/.config/nvim/abbreviations.vim

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal formatoptions+=t
  autocmd FileType gitcommit source ~/.config/nvim/abbreviations.vim

  " Tern settings for javascript
  autocmd InsertLeave,InsertEnter,CompleteDone *.js,*.jsx if pumvisible() == 0 | pclose | endif
  autocmd FileType javascript,javascript.jsx setlocal completeopt-=preview
  autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> gd :TernDef<cr>
  autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> K :TernDoc<cr>
  autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> <localleader>K :TernDocBrowse<cr>

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,sass,scss setlocal iskeyword+=-

  " Types of files to load Emmet
  autocmd FileType css,eruby,html,javascript,javascript.jsx,jsp EmmetInstall

  " Ruby completion settings
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Mapping q to close the windows
  autocmd FileType help nnoremap <buffer> <silent> q :bd<cr>
  autocmd FileType diff nnoremap <buffer> <silent> q :bd<cr>
  autocmd FileType qf   nnoremap <buffer> <silent> q :bd<cr>

  " This is so that delimitMate does not conflict with auto-close when dealing with tags
  autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
augroup END
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
let g:fzf_commits_log_options = '--color=always --date=short --graph --format="%C(yellow)%h %C(red)| %C(green)%ad%  %C(red)|%C(reset) %s%C(auto)%d %C(red)<- %C(black)%C(bold)%cr by [%an]"'
"}}}
" Gitgutter"{{{
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always=1
"}}}
" Neomake"{{{
let g:neomake_open_list = 2
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_javascript_enabled_makers = ['eslint']
"}}}
" Netrw settings"{{{

" Hide the useless information at the top
let g:netrw_banner=0

" Things to ignore when when using netrw
let g:netrw_list_hide='\.git,'
let g:netrw_list_hide.='\.tmp,'
let g:netrw_list_hide.='\.DS_Store,'
let g:netrw_list_hide.='vendor/rails/,'
let g:netrw_list_hide.='vendor/cache/,'
let g:netrw_list_hide.='\.gem,'
let g:netrw_list_hide.='\.coverage/,'
let g:netrw_list_hide.='log/,'
let g:netrw_list_hide.='tmp/,'
let g:netrw_list_hide.='\.idea/,'
let g:netrw_list_hide.='\.png,\.jpg,\.gif,'
let g:netrw_list_hide.='\.so,\.swp,\.zip,/\.Trash/,\.pdf,\.dmg,/Library/,/\.rbenv/,'
"}}}
"Rainbow"{{{
let g:rainbow_active = 1
"}}}
" Tern"{{{
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
endif
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
" Vim test"{{{
let test#strategy = "dispatch"
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
