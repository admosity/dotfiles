syntax on
inoremap jj <esc>

call plug#begin('~/.vim/plugged')

""" COMMON
" Status line
Plug 'itchyny/lightline.vim'

""" Code
" Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
" requires js-beautify
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'matchit.zip' " matching different kinds of tags based on language

" Tag management
Plug 'majutsushi/tagbar'
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'

""" Management
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

""" Javascript specific plugins
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
" tern for javascript
Plug 'marijnh/tern_for_vim'
Plug 'mattn/emmet-vim'

" Jade
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
""" PHP
"Plug 'captbaritone/better-indent-support-for-php-with-html'

""" Livescript
Plug 'gkz/vim-ls', {'for': 'ls'}


call plug#end()


" Autoformat hotkey
noremap <F3> :Autoformat<CR>

" Run bash in logged in mode
set shell=bash\ --login

" Nerd tree toggle
map <C-k><C-b> :NERDTreeToggle<CR>
noremap <C-g> :Ggrep -iI --exclude-standard --no-index '' <bar> :cw<left><left><left><left><left><left><left>
" Tagbar toggle
nmap <F8> :TagbarToggle<CR>

" CtrlP bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=' + getcwd() + '/.git ls-files -oc --exclude-standard']
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"map <C-p> :FZF!<CR>
"map <c-x><c-k> <plug>(fzf-complete-word)
"map <c-x><c-f> <plug>(fzf-complete-path)
"map <c-x><c-j> <plug>(fzf-complete-file-ag)
"map <c-x><c-l> <plug>(fzf-complete-line)


" Python enabled vim
let g:python_host_prog = '/usr/bin/python'

" Syntastic check on load 
let g:syntastic_check_on_open=1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Lightline install
" https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

"function! LightLineFugitive()
  "return exists('*fugitive#head') ? fugitive#head() : ''
"endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%') ? expand('%') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction
" END LIGHTLINE SETUP

" Show status line on single file
set laststatus=2
set noshowmode " hide bottom status line"
colorscheme molokai
set number

" Tabbing

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set smarttab

set backspace=indent,eol,start

" key combo timeout
set ttimeout
set ttimeoutlen=100

set guifont=SourceCodePro-Medium:h15

" turn on indentation
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" incremental search
set incsearch
set hlsearch
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase


" show current line
set cursorline

filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

hi MatchParen cterm=none ctermbg=green ctermfg=blue


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" multiple cursors escape functionality
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

set pastetoggle=<F9>
