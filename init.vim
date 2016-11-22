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

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-visual-star-search'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-runner'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'neomake/neomake'
Plug 'sickill/vim-pasta'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
"}}}
" Others"{{{

" Plug 'Konfekt/FastFold'
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-smooth-scroll'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"}}}
" Language related"{{{
" Ruby"{{{

Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'rails', 'eruby'] }
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
set foldlevelstart=99 " To make sure all folds are initially opened
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
set wildmode=longest:full,full " Set the wildmenu behaviour to be more like zsh
"}}}
" Custom functions"{{{
" Create directory on save if it doesn't exist"{{{
function! s:CreateNonExistantDirectory()
  let dir = expand('%:p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction
"}}}
" Delete all trailing white space on save"{{{
function! s:StripTrailingWhitespaces()
  " Save last search pattern and cursor position
  let _s = @/
  let l  = line(".")
  let c  = col(".")
  " Search all trailing whitespaces and replace them with nothing
  %s/\s\+$//e
  " Restore last search pattern and cursor position
  let @/ = _s
  call cursor(l, c)
endfunction
"}}}
" Don't close window, when deleting a buffer"{{{
function! s:BufCloseSavingWindow()
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

command! Bclose call <SID>BufCloseSavingWindow()
"}}}
" Integration with Ranger"{{{
function! s:OpenRangerIn(path)
  let currentPath = expand(a:path)
  let rangerCallback = { 'name': 'ranger' }
  function! rangerCallback.on_exit(id, code)
    silent! Bclose
      if filereadable('/tmp/chosenfile')
        exec system('sed -ie "s/ /\\\ /g" /tmp/chosenfile')
        exec 'argadd ' . system('cat /tmp/chosenfile | tr "\\n" " "')
        exec 'edit ' . system('head -n1 /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
      endif
  endfunction
  enew
  call termopen('ranger --choosefiles=/tmp/chosenfile ' . currentPath, rangerCallback)
  startinsert
endfunction

command! RangerInCurrentDirectory call <SID>OpenRangerIn("%:p:h")
command! RangerInWorkingDirectory call <SID>OpenRangerIn("")

" Don't load netrw since I am using ranger as my file explorer
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
"}}}
"}}}
" Auto commands"{{{
augroup vimrcEx
  autocmd!

  autocmd VimEnter * source ~/dotfiles/abbreviations.vim

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
  autocmd BufWritePre * :call <SID>CreateNonExistantDirectory()

  autocmd InsertLeave,BufWinEnter,WinEnter * set cursorline
  autocmd InsertEnter,BufWinLeave,WinLeave * set nocursorline

  " Automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =

  " Automatically enter insert mode when entering terminal buffer
  autocmd BufWinEnter,WinEnter term://* startinsert

  " Run NeoMake on read and write operations
  autocmd BufReadPost,BufWritePost * Neomake

  " Maps K to open vim help for the word under cursor when editing vim files
  autocmd FileType vim setlocal keywordprg=:help

  " Enable different indentation for language specific files
  autocmd FileType java       setlocal tabstop=8 softtabstop=4 shiftwidth=4
  autocmd FileType javascript setlocal tabstop=4 softtabstop=2 shiftwidth=2

  " Automatically wrap at 80 characters and spell check text and markdowns
  autocmd FileType text,markdown setlocal textwidth=80
  autocmd FileType text,markdown setlocal spell
  autocmd FileType text,markdown setlocal formatoptions+=t

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal formatoptions+=t

  " Enable spellchecking for org files
  autocmd FileType org setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,sass,scss setlocal iskeyword+=-

  " Ruby completion settings
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Mapping q to close the windows
  autocmd FileType help  nnoremap <buffer> <silent> q :bd<cr>
  autocmd FileType diff  nnoremap <buffer> <silent> q :bd<cr>
  autocmd FileType qf    nnoremap <buffer> <silent> q :bd<cr>
  autocmd FileType netrw nnoremap <buffer> <silent> q :Rex<cr>

  " Folding options
  autocmd FileType vim,tmux,zsh setlocal foldlevel=0
  " autocmd FileType css,html,javascript,javascript.jsx setlocal foldmethod=syntax
augroup END
"}}}
" Custom mappings"{{{

" Easier esc mapping
inoremap jk <Esc>
inoremap kj <Esc>

" Easier navigating between panes
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-\> <C-w>p

" Allow j and k to move down wrapped lines
nnoremap j gj
nnoremap k gk

" Map H and L to more sensible options compared to their h and l counterpart
noremap H ^
noremap L g_

" Switching between buffers
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprevious<cr>
nnoremap <tab> <C-^>

" For switching two characters around and repeatable by .
nnoremap <silent> <Plug>TransposeCharacters xp
      \:call repeat#set("\<Plug>TransposeCharacters")<cr>
nmap xp <Plug>TransposeCharacters

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
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-h> <BS>

" Smarter history navigation with up and down arrows in command mode
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" Remap for easier command mode access
nnoremap ; :
vnoremap ; :

" Remap Q for exmode to run macros instead
nnoremap Q @q
" Change the behaviour of Y to be more inline with the rest(eg C, D)
nnoremap Y yg_

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" Makes the dot command behave on a Visually selected line
vnoremap . :norm.<cr>
" Allow star to go back to the first search term
nnoremap * *N
vnoremap * *N
nnoremap g* g*N
vnoremap g* g*N
" Copy to system clipboard
vnoremap <C-c> "*y

" Remap to increase number by 1
noremap <C-z> <C-a>
" Switching out to terminal
nnoremap <NUL> <C-z>
"}}}
" Leader mappings"{{{

let maplocalleader = "\\"
let mapleader = "\<Space>"
nnoremap <leader>a :Ag<Space>
nnoremap <leader>b :History<cr>
nnoremap <leader>bi :!bundle install<cr>
nnoremap <silent> <leader>co :copen<cr>
nnoremap <silent> <leader>cc :cclose<cr>
nnoremap <leader>e :w<cr>:TestLast<cr>
nnoremap <leader>g :w<cr>:Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <silent> <leader>h :nohlsearch<cr>
nmap <leader>ha <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterUndoHunk
nmap <leader>hv <Plug>GitGutterPreviewHunk
nnoremap <leader>i mzgg=G`z
nnoremap <leader>l :Lines<cr>
" Edit any register(" by default) in the command line window, press enter to finish
nnoremap <silent> <leader>m :<C-u><C-r><C-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><C-f><left>
nnoremap <leader>ni :!npm install<cr>
nnoremap <leader>o :Files<cr>
nnoremap <leader>p :put =nr2char(10)<cr>"*gp
nnoremap <leader>P :put! =nr2char(10)<cr>"*gp
nnoremap <leader>pi :w<cr>:source $MYVIMRC<cr>:nohlsearch<cr>:PlugUpgrade<cr>:PlugUpdate<cr>
nnoremap <leader>r :w<cr>:TestNearest<cr>
nnoremap <leader>ra :A<cr>
nnoremap <leader>rc :Econtroller<Space>
nnoremap <leader>rf :Eintegrationtest<Space>
nnoremap <leader>rm :Emodel<Space>
nnoremap <leader>rr :R<cr>
nnoremap <leader>ru :Eunittest<Space>
nnoremap <leader>rv :Eview<Space>
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
nnoremap <leader><leader> :RangerInWorkingDirectory<cr>

" Mappings to zoom in on a pane and to rebalance
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
" Plugin mappings and settings"{{{
"Airline"{{{
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
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
let g:EasyMotion_keys = 'asdfghjkl;qwertyuiopzxcvbnm'

nmap s <Plug>(easymotion-overwin-f2)
nmap t <Plug>(easymotion-tl)
nmap T <Plug>(easymotion-Tl)
nmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
omap t <Plug>(easymotion-tl)
omap T <Plug>(easymotion-Tl)
omap f <Plug>(easymotion-fl)
omap F <Plug>(easymotion-Fl)
"}}}
" Emmet"{{{
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

" Types of files to load Emmet
autocmd vimrcEx FileType css,eruby,html,javascript,javascript.jsx,jsp EmmetInstall
"}}}
" Fzf"{{{

" Replace the default file completion with fzf-based fuzzy completion
imap <C-x><C-f> <plug>(fzf-complete-path)
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <C-x><C-k> fzf#complete('cat /usr/share/dict/words')
" Replace the default line completion with fzf-based fuzzy completion
imap <C-x><C-l> <plug>(fzf-complete-line)

" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Define the git log options flag
let g:fzf_commits_log_options = '--color=always --date=short --graph --format=
      \"%C(yellow)%h %C(red)| %C(green)%ad%  %C(red)|%C(reset) %s%C(auto)%d %C(red)<- %C(black)%C(bold)%cr by [%an]"'

" Change the highlight of search results to red colour instead
autocmd vimrcEx VimEnter * command! -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '--color-match "1;31"', fzf#vim#default_layout)

" Override statusline as you like
function! s:fzf_statusline()
  highlight fzf1 ctermfg=196 ctermbg=240
  highlight fzf2 ctermfg=254 ctermbg=240
  highlight fzf3 ctermfg=254 ctermbg=240
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd vimrcEx User FzfStatusLine call <SID>fzf_statusline()

" Customize fzf colors to match your color scheme
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
"}}}
" Gitgutter"{{{
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always=1

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual
"}}}
" Incsearch"{{{
let g:incsearch#magic = '\v'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"}}}
" Neomake"{{{
let g:neomake_open_list = 2
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_javascript_enabled_makers = ['eslint']
"}}}
"Rainbow"{{{
let g:rainbow_active = 1
"}}}
" Sideways"{{{
nnoremap <silent> gsh :SidewaysLeft<cr>
nnoremap <silent> gsl :SidewaysRight<cr>
"}}}
" Tern"{{{

" Settings to control how much description is given in the completion menu
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

" Disable the preview that shows automatically when autocompleting
autocmd vimrcEx InsertLeave,InsertEnter,CompleteDone *.js,*.jsx if pumvisible() == 0 | pclose | endif
autocmd vimrcEx FileType javascript,javascript.jsx setlocal completeopt-=preview
" Define some local tern key bindings
autocmd vimrcEx FileType javascript,javascript.jsx nnoremap <silent> <buffer> gd :TernDef<cr>
autocmd vimrcEx FileType javascript,javascript.jsx nnoremap <silent> <buffer> K :TernDoc<cr>
autocmd vimrcEx FileType javascript,javascript.jsx nnoremap <silent> <buffer> <localleader>K :TernDocBrowse<cr>
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
"Vim commentary"{{{
autocmd vimrcEx Bufenter *.conf      setlocal commentstring=#\ %s
autocmd vimrcEx Bufenter *.zsh-theme setlocal commentstring=#\ %s
"}}}
" Vim javascript libraries syntax"{{{
let g:used_javascript_libs = 'jquery,underscore,react,jasmine,flux'
"}}}
" Vim smooth scroll"{{{
nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll, 20, 2)<cr>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll, 20, 2)<cr>
nnoremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 20, 4)<cr>
nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 20, 4)<cr>
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
