setlocal cindent

" To not continue comment chars after using 'o' or 'O'
set formatoptions-=o

" Compile inside vim using make (has to be a Makefile present in the directory)
map <F5> :w <CR>:!make; if [ $? -eq 0 ]; then echo "---"; echo -e "\e[32;1m✔\e[39;0m"; else echo "---"; echo -en "\e[31;1m✘\e[39;0m" "\033[1D\e[31m-$?\e[39;0m\n"; fi<CR>

" Debug ./a.out
nnoremap <F6> :w<CR> :Termdebug %:r<CR><c-w>H<c-w>l<c-w>j<c-w>K :aunmenu WinBar<CR> <c-w>j<c-w>8-<c-w>32> file ./a.out<Enter>
