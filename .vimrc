set ts=4 sw=4 sta et sts=4 ai
let python_highlight_all = 1
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set pastetoggle=<F2>
set ic
"  Corrige l'affiche du autocomplete
hi PmenuSel   ctermfg=White   ctermbg=Blue 

" Highlight du python debugger
highlight importpdb ctermfg=darkmagenta guifg=darkmagenta
match importpdb /.*pdb.*/ 

nnoremap <leader>p oimport pdb; pdb.set_trace()<Esc>
