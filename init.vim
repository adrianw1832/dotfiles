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
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
Plug 'neomake/neomake'
Plug 'romainl/vim-qf'
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
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'yuttie/comfortable-motion.vim'
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
" Markdown"{{{
Plug 'junegunn/vim-xmark', { 'do': 'make' }
"}}}
"}}}
call plug#end()
"}}}
" Settings"{{{

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
set grepprg=rg\ --vimgrep " Use ripgrep as default for grep
set hidden " Change default behaviour of opening file of existing buffer
set ignorecase " Ignore case when searching
set inccommand=nosplit " Use live substitution introduced in 0.1.7
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
function! s:CreateNonExistantDirectory() abort
  let dir = expand("%:p:h")

  if !isdirectory(dir)
    call mkdir(dir, "p")
    echo "Created non-existing directory: ".dir
  endif
endfunction
"}}}
" Delete all trailing white space on save"{{{
function! s:StripTrailingWhitespaces() abort
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
" Merge multiple empty lines to one on save"{{{
function! s:MergeMultipleEmptyLines() abort
  " Save last search pattern and cursor position
  let _s = @/
  let l  = line(".")
  let c  = col(".")
  " Search all multiple empty lines and merge them to one
  %s/^$\n^$//e
  " Restore last search pattern and cursor position
  let @/ = _s
  call cursor(l, c)
endfunction
"}}}
" Delete empty buffers"{{{
function! s:DeleteEmptyBuffers() abort
  let buffers = filter(range(1, bufnr("$")), 'bufloaded(v:val) && empty(bufname(v:val)) && getbufline(v:val, 1, 2) == [""]')
  if !empty(buffers)
    execute "bwipe ".join(buffers, " ")
  endif
endfunction
"}}}
" Don't close window, when deleting a buffer"{{{
function! s:BufCloseSavingWindow() abort
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

command! Bclose call s:BufCloseSavingWindow()
"}}}
" Integration with Ranger"{{{

" Don't load netrw since I am using ranger as my file explorer
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

function! s:OpenRangerIn(path) abort
  let currentPath = expand(a:path)
  let rangerCallback = { "name": "ranger" }
  function! rangerCallback.on_exit(id, code) abort
    Bclose
    wincmd =
    if filereadable("/tmp/chosenfile")
      execute system('sed -ie "s/ /\\\ /g" /tmp/chosenfile')
      execute "argadd " . system('cat /tmp/chosenfile | tr "\\n" " "')
      execute "edit " . system("head -n1 /tmp/chosenfile")
      call system("rm /tmp/chosenfile")
    endif
    call s:DeleteEmptyBuffers()
  endfunction
  enew
  wincmd |
  call termopen("ranger --choosefiles=/tmp/chosenfile " . currentPath, rangerCallback)
  startinsert
endfunction

command! RangerInCurrentDirectory silent call s:OpenRangerIn("%:p:h")
command! RangerInWorkingDirectory silent call s:OpenRangerIn("")

function! s:OpenRangerWhenNoFileIsGiven() abort
  if argc() == 0 && !exists("s:std_in")
    call s:OpenRangerIn("")
  elseif argc() == 1 && isdirectory(argv(0))
    bd
    execute "cd" fnameescape(argv(0))
    call s:OpenRangerIn("")
  endif
endfunction
"}}}
"}}}
" Auto commands - init"{{{
augroup init
  autocmd!

  autocmd VimEnter * source ~/dotfiles/abbreviations.vim

  " This mimics netrw's behaviour when no file or a direcotry is given upon open
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * call s:OpenRangerWhenNoFileIsGiven()

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  autocmd BufWritePre * call s:CreateNonExistantDirectory()
  autocmd BufWritePre * call s:StripTrailingWhitespaces()
  autocmd BufWritePre * call s:MergeMultipleEmptyLines()

  autocmd InsertLeave,BufWinEnter,WinEnter * set cursorline
  autocmd InsertEnter,BufWinLeave,WinLeave * set nocursorline

  " Automatically rebalance windows on vim resize
  autocmd VimResized * wincmd =

  " Automatically enter insert mode when entering terminal buffer
  autocmd BufWinEnter,WinEnter term://* startinsert
augroup END
"}}}
" Auto commands - filetypes"{{{
augroup Filetypes
  autocmd!

  " Enable different indentation for language specific files
  autocmd FileType java       setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

  " Easier gf file navigation for specific languages
  autocmd FileType javascript setlocal suffixesadd+=.js

  " Maps K to open vim help for the word under cursor when editing vim files
  autocmd FileType vim setlocal keywordprg=:help

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

  " Folding options
  autocmd FileType vim,tmux setlocal foldlevel=0
  autocmd BufEnter *.zsh*   setlocal foldlevel=0
  " autocmd FileType css,html,javascript,javascript.jsx setlocal foldmethod=syntax

  " Mapping q to close the windows
  autocmd FileType help  nnoremap <silent> <buffer> q :bd<CR>
  autocmd FileType diff  nnoremap <silent> <buffer> q :bd<CR>
  autocmd FileType qf    nnoremap <silent> <buffer> q :bd<CR>

  " Mappings to make git interactive rebase easier
  autocmd FileType gitrebase nnoremap <silent> <buffer> gd :Drop<CR>
  autocmd FileType gitrebase nnoremap <silent> <buffer> ge :Edit<CR>
  autocmd FileType gitrebase nnoremap <silent> <buffer> gf :Fixup<CR>
  autocmd FileType gitrebase nnoremap <silent> <buffer> gp :Pick<CR>
  autocmd FileType gitrebase nnoremap <silent> <buffer> gr :Reword<CR>
  autocmd FileType gitrebase nnoremap <silent> <buffer> gs :Squash<CR>
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
vnoremap j gj
vnoremap k gk

" Map H and L to more sensible options compared to their h and l counterpart
noremap H ^
noremap L g_

" Switching between buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <tab> <C-^>

" For switching two characters around and repeatable by .
nnoremap <silent> <Plug>TransposeCharacters xp
      \call repeat#set("\<Plug>TransposeCharacters")<CR>
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
xnoremap ; :
" Remappings for backtick since it's more useful
nnoremap ' `
nnoremap ` '

" Remap Q for exmode to run macros instead
nnoremap Q @q
" Change the behaviour of Y to be more inline with the rest(eg C, D)
nnoremap Y yg_

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" Makes the dot command behave on a Visually selected line
xnoremap . :norm.<CR>
" Allow star to go back to the first search term
nnoremap <silent> * *N :set hlsearch<CR>
xnoremap <silent> * *N :set hlsearch<CR>
nnoremap <silent> g* g*N :set hlsearch<CR>
xnoremap <silent> g* g*N :set hlsearch<CR>
" Copy to system clipboard
xnoremap <C-c> "*y

" Remap to increase number by 1
noremap <C-z> <C-a>
" Switching out to terminal using Ctrl-space
nnoremap <NUL> <C-z>
"}}}
" Leader mappings"{{{

let maplocalleader = "\\"
let mapleader = "\<Space>"
nnoremap <Leader>a :Ag<Space>
nnoremap <Leader>bi :!bundle install<CR>
nnoremap <Leader>e :w<CR>:TestLast<CR>
nnoremap <Leader>g :w<CR>:Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :silent Glog -25<CR>:copen<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>h :History<CR>
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
nnoremap <Leader>i mzgg=G`z
nnoremap <Leader>l :Lines<CR>
" Edit any register(" by default) in the command line window, press enter to finish
nnoremap <silent> <Leader>m :<C-u><C-r><C-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><C-f><left>
nnoremap <Leader>ni :!npm install<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>p :put =nr2char(10)<CR>"*p`[=`]`]
nnoremap <Leader>P :put! =nr2char(10)<CR>"*p`[=`]`]
nnoremap <Leader>pi :w<CR>:source $MYVIMRC<CR>:nohlsearch<CR>:PlugUpgrade<CR>:PlugUpdate<CR>
nnoremap <Leader>r :w<CR>:TestNearest<CR>
nnoremap <Leader>ra :A<CR>
nnoremap <Leader>rc :Econtroller<Space>
nnoremap <Leader>rf :Eintegrationtest<Space>
nnoremap <Leader>rm :Emodel<Space>
nnoremap <Leader>rr :R<CR>
nnoremap <Leader>ru :Eunittest<Space>
nnoremap <Leader>rv :Eview<Space>
nnoremap <silent> <Leader>sn :UltiSnipsEdit<CR>
nnoremap <Leader>so :w<CR>:source $MYVIMRC<CR>:AirlineRefresh<CR>:nohlsearch<CR>:echoe "Vimrc sourced!"<CR>
" Going back to the last spelling mistake and choosing the 1st option
nnoremap <silent> <Leader>sp mz[s1z=`z
nnoremap <Leader>t :w<CR>:TestFile<CR>
nnoremap <Leader>T :TestVisit<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qq :Bclose<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>qw :wq<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wqa :wqa<CR>
" Maximise the quickfix window, useful for reading test errors
nnoremap <Leader>u :copen<CR>:wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <Leader>vi :e $MYVIMRC<CR>
nnoremap <Leader>y :w<CR>:TestSuite<CR>
nnoremap <Leader><Leader> :RangerInWorkingDirectory<CR>
" Mappings to zoom in on a pane and to rebalance
nnoremap <silent> <Leader>= :wincmd _<CR>:wincmd \|<CR>
nnoremap <silent> <Leader>- :wincmd =<CR>
nnoremap <Leader>; mzA;<Esc>`z
"}}}
" Plugin mappings and settings"{{{
"Airline"{{{
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"}}}
" Close tag"{{{
let g:closetag_filenames = "*.erb,*.html,*.js,*.jsx"
"}}}
" Commentary"{{{
augroup Commentary
  autocmd!
  autocmd Bufenter *.conf      setlocal commentstring=#\ %s
  autocmd Bufenter *gitconfig  setlocal commentstring=#\ %s
  autocmd Bufenter *.zsh-theme setlocal commentstring=#\ %s
augroup END
"}}}
" Deoplete"{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
"}}}
" Deoplete ternjs"{{{
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
"}}}
" Easy align"{{{

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Disabling and foldmethod during alignment
let g:easy_align_bypass_fold = 1
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
vmap t <Plug>(easymotion-tl)
vmap T <Plug>(easymotion-Tl)
vmap f <Plug>(easymotion-fl)
vmap F <Plug>(easymotion-Fl)
omap t <Plug>(easymotion-tl)
omap T <Plug>(easymotion-Tl)
omap f <Plug>(easymotion-fl)
omap F <Plug>(easymotion-Fl)
"}}}
" Emmet"{{{
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

augroup Emmet
  autocmd!
  autocmd FileType css,eruby,html,javascript,javascript.jsx,jsp EmmetInstall
augroup END
"}}}
" Fugitive"{{{
augroup Fugitive
  autocmd!
" Mappings to make partial diffs easier
  autocmd BufReadPost fugitive://*/.git//0/* if pumvisible() == 0 | pclose | endif
  autocmd BufReadPost fugitive://*/.git//0/* nnoremap <silent> do :diffget<CR>]c
  autocmd BufReadPost fugitive://*/.git//0/* nnoremap <silent> dp :diffput<CR>]c
  autocmd BufReadPost fugitive://*/.git//0/* nnoremap <silent> du :wincmd w<CR>:normal u<CR>:wincmd w<CR>
  autocmd BufReadPost fugitive://*/.git//0/* xnoremap <silent> do :diffget<CR>
  autocmd BufReadPost fugitive://*/.git//0/* xnoremap <silent> dp :diffput<CR>
  autocmd BufDelete   fugitive://*/.git//0/* nunmap do
  autocmd BufDelete   fugitive://*/.git//0/* nunmap dp
  autocmd BufDelete   fugitive://*/.git//0/* nunmap du
  autocmd BufDelete   fugitive://*/.git//0/* xunmap do
  autocmd BufDelete   fugitive://*/.git//0/* xunmap dp
augroup END
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
let g:fzf_commits_log_options = '--color=always --graph --date=format:%a\ %H:%M\ %d-%m-%Y --format=gitlog'

" Change Ag to accept arguemnts and also highlight search results to red instead
function! s:fzf_ag_raw(command_suffix, ...) abort
  return call('fzf#vim#grep', extend(['ag --nogroup --column --color --color-match "1;31" '.a:command_suffix, 1], a:000))
endfunction

" Override statusline as you like
function! s:fzf_statusline() abort
  highlight fzf1 ctermfg=196 ctermbg=237
  highlight fzf2 ctermfg=254 ctermbg=237
  highlight fzf3 ctermfg=254 ctermbg=237
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

augroup Fzf
  autocmd!
  autocmd VimEnter * command! -nargs=* Ag :call s:fzf_ag_raw(<q-args>)
  autocmd User FzfStatusLine call s:fzf_statusline()
augroup END

" Customize fzf colors to match your color scheme
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Conditional'],
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
" Javascript libraries syntax"{{{
let g:used_javascript_libs = 'jquery,underscore,react,jasmine,flux'
"}}}
" Neomake"{{{
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_error_sign = {'text': '', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '', 'texthl': 'NeomakeWarningSign'}
let g:airline#extensions#neomake#warning_symbol = ' '
let g:airline#extensions#neomake#error_symbol = ' '

augroup Neomake
  autocmd!
  autocmd BufEnter,BufWritePost * Neomake
augroup END
"}}}
" Qf"{{{
augroup Qf
  autocmd!
  autocmd VimEnter * nmap coc <Plug>QfCtoggle
  autocmd VimEnter * nmap col <Plug>QfLtoggle
augroup END
"}}}
" Rainbow"{{{
let g:rainbow_active = 1
"}}}
" Sexp"{{{
let g:sexp_enable_insert_mode_mappings = 1
"}}}
" Sideways"{{{
nnoremap <silent> gsh :SidewaysLeft<CR>
nnoremap <silent> gsl :SidewaysRight<CR>
"}}}
" Surround"{{{

" To determine the ASCII code to use, do :echo char2nr("-")
let g:surround_45 = "<% \r %>" " - for <% %>
let g:surround_61 = "<%= \r %>" " = for <%= %>
let g:surround_51 = "#{\r}" " 3 for #{}
let g:surround_52 = "${\r}" " 4 for ${}
"}}}
" Targets"{{{
let g:targets_argOpening = '[({[]'
let g:targets_argClosing = '[]})]'
let g:targets_seekRanges = 'cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB Ab AB rb rB al Al'
"}}}
" Tern"{{{

" Settings to control how much description is given in the completion menu
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

augroup Tern
  autocmd!
  " Disable the preview that shows automatically when autocompleting
  autocmd Insertleave,InsertEnter,CompleteDone *.js,*.jsx if pumvisible() == 0 | pclose | endif
  autocmd Filetype javascript,javascript.jsx setlocal completeopt-=preview
  " Define some local tern key bindings
  autocmd Filetype javascript,javascript.jsx nnoremap <silent> <buffer> gd :TernDef<CR>
  autocmd Filetype javascript,javascript.jsx nnoremap <silent> <buffer> K :TernDoc<CR>
  autocmd Filetype javascript,javascript.jsx nnoremap <silent> <buffer> <localleader>K :TernDocBrowse<CR>
augroup END
"}}}
" Test"{{{
let test#strategy = "dispatch"
"}}}
" Ultisnips"{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/UltiSnips', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']
"}}}
"}}}
