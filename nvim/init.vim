"---------------------
" Basic editor config
"---------------------
set nocompatible            	" disable compatibility to old-time vi
set showmatch               	" show matching brackets.
set ignorecase              	" case insensitive matching
set mouse=v                 	" middle-click paste with mouse
set hlsearch                	" highlight search results
set tabstop=2               	" number of columns occupied by a tab character
set softtabstop=2           	" see multiple spaces as tabstops so <BS> does the right thing
set expandtab               	" converts tabs to whie space
set shiftwidth=4            	" width for autoindents
set autoindent              	" indent a new line the same amount as the line just typed
set number                  	" add line numbers
set relativenumber            " set the relative numbers
set wildmode=longest,list   	" get bash-like tab completions
set cc=80                   	" set an 80 column border for good coding style
filetype plugin indent on   	" allows auto-indenting depending on file type
colorscheme slate             " set the colorscheme
syntax on                   	" syntax highlightingt
set wildmenu 			            " Show command line's tab cmpletion options
set laststatus=2              " always thos the satus-bar
set nofoldenable              " disable the folginf by default


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

  " ----------------
  " Language support
  " ----------------
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " ----------------
  " Python
  " ----------------

  " Code Completion
  " depends on jedi (python -m pip install jedi)
  Plug 'zchee/deoplete-jedi'  " deoplete for python
  Plug 'tmhedberg/SimpylFold' " better folding for python

  " Code Quality
  Plug 'nvie/vim-flake8'
  Plug 'heavenshell/vim-pydocstring'

  " ----------------
  " GUI Enhancements
  " ----------------
  " Ranger in NVIM
  Plug 'kevinhwang91/rnvimr'

  " Highlight whitespaces
  Plug 'ntpeters/vim-better-whitespace'

" Initialize plugin system
call plug#end()

" Colorscheme


" Settings for Python, needed for some plugins
let g:python3_host_prog = '/usr/bin/python3'
let g:python2_host_prog = '/usr/bin/python2'

"""" Status-Bar
" SRC: https://gabri.me/blog/diy-vim-statusline
" SRC: https://jdhao.github.io/2019/11/03/vim_custom_statusline/

let g:currentmode={
       \ 'n'      : 'NORMAL ',
       \ 'no'     : 'N·Operator Pending',
       \ 'v'      : 'VISUAL ',
       \ 'V'      : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 's'      : 'Select',
       \ 'S'      : 'S·Line',
       \ '\<C-S>' : 'S·Block',
       \ 'i'      : 'INSERT ',
       \ 'R'      : 'R ',
       \ 'Rv'     : 'V·Replace ',
       \ 'c'      : 'Command ',
       \ 'cv'     : 'Vim Ex',
       \ 'ce'     : 'Ex',
       \ 'r'      : 'Prompt',
       \ 'rm'     : 'More',
       \ 'r?'     : 'Confirm',
       \ '!'      : 'Shell',
       \ 't'      : 'Terminal'
       \}

" Green forground, no backgrund
hi User1 ctermfg=2
" Green background, white forground
hi User2 ctermfg=0 ctermbg=2

set statusline=
set statusline=%#User1#
set statusline+=\%{toupper(g:currentmode[mode()])}
set statusline+=%#ModeMsg#
set statusline+=\ %F
set statusline+=\ %{&modified?'[+]':''}

" Settings for Rnvimr
" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine
" ALT + i
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
" ALT + o
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>

" Configuration for better_whitespaces
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1

" Folding for Files
set foldmethod=indent
set foldlevel=2

set fileformat=unix

" DEOPLET Config Python
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = 'python3'

" pydocstrings
let g:pydocstring_formatter = 'numpy'
