" Vundle plugin manager
set nocompatible
filetype off
" path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" autocomplete for clang 
Plugin 'neoclide/coc.nvim'

" nerdtree plugin
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'  " shows changed git files



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
autocmd VimEnter * NERDTree | wincmd p
autocmd BufWinEnter * NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CoC options ----------------------------------------------
set hidden
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Highlight the symbol and its reference when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>





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

