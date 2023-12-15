set autoindent
set expandtab

" Compile inside vim using make (has to be a Makefile present in the directory)
map <F5> :w <CR>:!make; if [ $? -eq 0 ]; then echo "---"; echo -e "\e[32;1m✔\e[39;0m"; else echo "---"; echo -en "\e[31;1m✘\e[39;0m" "\033[1D\e[31m-$?\e[39;0m\n"; fi<CR>
