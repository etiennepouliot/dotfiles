
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
"Plugin 'davidhalter/jedi-vim'
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
Plugin 'Townk/vim-autoclose'
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
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
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

nnoremap <leader>p oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <leader>f oprint("".format())<Esc>9hhi
nnoremap <leader>d odef():<Esc>hhi
set pastetoggle=<leader>v

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

" Fix backspace
set backspace=indent,eol,start

" Pour ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby nnoremap <leader>p orequire 'pry' ; binding.pry<Esc>
