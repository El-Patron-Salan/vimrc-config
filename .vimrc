" auto pop up 
let g:deoplete#enable_at_startup = 1

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-10/lib'
" or path directly to the library file
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang-10.so.1'
let g:clang_complete = 1 "automatically selects the first entry in the pop up menu
let g:clang_snippets = 1 "do some snippets magic on code placeholders like function argument, template parameters, etc
" if there is any error
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_use_library=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
let g:clang_auto_select=1

" Use visual bell instead of beeping when doing something wrong
set visualbell

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

colorscheme molokai
set background=dark
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

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

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
set cmdheight=1

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

