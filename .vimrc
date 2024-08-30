set nocompatible              " be iMproved, required
filetype off                  " required
" All of your Plugins must be added before the following line

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plug de stats bar
Plugin 'vim-airline/vim-airline'
set laststatus=2
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
Plugin 'junegunn/vim-easy-align'
Plugin 'Townk/vim-autoclose'
Plugin 'hdima/python-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'dense-analysis/ale'
Plugin 'smbl64/vim-black-macchiato'
Plugin 'vim-scripts/Improved-AnsiEsc'

let g:black_skip_string_normalization=1
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8' ]
"  E221, # Multiple spaces before operator
"  E241, # Multiple spaces after ','
"  E251, # Unexpected spaces around keyword / parameter equals 
"  E%01, # Line too long
"  W503, # Line break occurred before a binary operator (W503) <-- Conflit avec W504
let g:ale_python_flake8_options="--ignore=E221,E241,E251,E501,W503"
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8']

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" started In Diff-Mode set diffexpr (plugin not loaded yet)


set ts=4 sw=4 sta et sts=4 ai
let python_highlight_all = 1
"set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
syntax on
set nowrap
set ic


" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"  Corrige l'affiche du autocomplete
hi PmenuSel   ctermfg=White   ctermbg=Blue 

" Highlight du python debugger
highlight importpdb ctermfg=darkmagenta guifg=darkmagenta
match importpdb /.*pdb.*/ 

let mapleader=","

nnoremap <leader>p oimport ipdb; ipdb.set_trace()# noqa<Esc>
nnoremap <leader>f oprint("".format())<Esc>9hhi
nnoremap <leader>d odef():<Esc>hhi
set pastetoggle=<leader>v
nnoremap <space>l :lnext<CR>
nnoremap <space>p :lprevious<CR>
nnoremap <space>r :lrewind<CR>

:function ToggleWrap()
: if (&wrap == 1)
:   if (&linebreak == 0)
:     set linebreak
:   else
:     set nowrap
:   endif
: else
:   set wrap
:   set nolinebreak
: endif
:endfunction

map <leader>w :call ToggleWrap()<CR>

set hlsearch

" Fix backspace
set backspace=indent,eol,start
set background=light

