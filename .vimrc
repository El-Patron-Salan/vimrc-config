" auto pop up 
let g:deoplete#enable_at_startup = 1

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-10/lib'
" or path directly to the library file
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang-10.so.1'
let g:clang_complete = 1 "automatically selects the first entry in the pop up menu
let g:clang_snippets = 1 "do some snippets magic on code placeholders like function argument, template parameters, etc

" highlighting text
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

colorscheme molokai

" uni code support
set encoding=utf-8

" avoid wrapping
set linebreak

" enable syntax highlight
syntax enable

" enable line wrapping
set wrap

" show line numbers
set number

" always display the status bar
set laststatus=2

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


