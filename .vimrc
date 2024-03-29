" Vundle plugin manager
set nocompatible
filetype off
" path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" nerdtree plugin
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'  " shows changed git files

" every bracket ha it's own color
Plugin 'frazrepo/vim-rainbow'

" status bar
Plugin 'itchyny/lightline.vim'

" git options
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" punk colorscheme
Plugin 'bignimbus/pop-punk.vim'

call vundle#end()            
filetype plugin indent on

" clang options ------------------------------------------
" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-10/lib'
" or path directly to the library file
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang-10.so.1'
" do some snippets magic on code placeholders like function argument, template parameters, etc
let g:clang_snippets = 1
" if there is any error
let g:clang_hl_errors=1
let g:clang_use_library=1
" Limit memory use
let g:clang_memory_percent=70
let g:clang_auto_select=1

" NerdTree options -----------------------------------------
let NERDTreeMinimalUI  = 1
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 36
" Open file directly to window not NerdTree with lightline on
augroup NERD
     au!
     autocmd VimEnter * NERDTree
     autocmd VimEnter * wincmd p
     autocmd VimEnter * call lightline#update()
augroup END

autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Rainbow Parentheses --------------------------------------------
let g:rainbow_active = 1

" Highlight line number
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END


highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline


" General options ------------------------------------------------
" Use visual bell instead of beeping when doing something wrong
set visualbell

" Redraw screen only when needed
set lazyredraw

" Move vertically by visual line
nmap j gj
nmap k gk

" Temporary switch to paste mode
set pastetoggle=<F2>

" Stop always going to first char in line
set nostartofline

" Allowing to copy to other programs
set clipboard=unnamedplus

" highlighting text
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

colorscheme pop-punk
" pop-punk ANSI colors for vim terminal
let g:terminal_ansi_colors = pop_punk#AnsiColors()

" for lightline theme - this needs underscore too
""t g:lightline.colorscheme = 'pop_punk'
let g:lightline = {
      \ 'colorscheme': 'pop_punk',
      \ }

"set background=dark
"let g:molokai_original = 1
"let g:rehash256 = 1

let $LANG='en' 
" uni code support
set encoding=utf8

" enable syntax highlight
syntax enable

" enable line wrapping
set wrap
set ai
set si

" show line numbers
set number

" always display the status bar
set laststatus=2
set noshowmode
""set t_Co=256 
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" enable mouse for scrolling and resizing
set mouse=a

" show title 
set title

" fold based on indention levels
"set foldmethod=indent

" enable spellchecking
set spell

" Sets how many lines of history VIM has to remember
set history=500

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" Add a bit extra margin to the left
set foldcolumn=1

" Height of the command bar
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set updatetime=300

" A buffer becomes hidden when it is abandoned
set hid

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Line break on 500 characters
set lbr
set tw=500

" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [  []<ESC>hli
inoremap (  ()<ESC>hli
inoremap "  ""<ESC>hli
inoremap '  ''<ESC>hli

