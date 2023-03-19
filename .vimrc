set nocompatible
set clipboard=unnamedplus
filetype plugin on
let mapleader=","

" For better style
set nu
set autoindent
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
set nofoldenable

" Do not skip lines
nnoremap <buffer> j gj
nnoremap <buffer> k gk

" Compile inside vim using make (has to be a Makefile present in the directory)
map <F5> :w <CR>:!make; if [ $? -eq 0 ]; then echo "---"; echo -e "\e[32;1m✔\e[39;0m"; else echo "---"; echo -en "\e[31;1m✘\e[39;0m" "\033[1D\e[31m-$?\e[39;0m\n"; fi<CR>
" Compile inside vim for C 
map <F6> :w <CR>:!g++ -Wall -pedantic -g -fsanitize=address % && ./a.out; if [ $? -eq 0 ]; then echo "---"; echo -e "\e[32;1m✔\e[39;0m"; else echo "---"; echo -en "\e[31;1m✘\e[39;0m" "\033[1D\e[31m-$?\e[39;0m\n"; fi <CR>
" Compile and launch debugger
map <S-F6> :w <CR>:!g++ -Wall -pedantic -g -fsanitize=address % && gdb ./a.out <CR>

" Buffer handeling
set hidden

call plug#begin()
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'powerline/powerline'

	Plug 'dense-analysis/ale', { 'for': ['c', 'python', 'sh', 'cpp'] }

	Plug 'Raimondi/delimitMate', { 'for': ['c', 'python', 'sh', 'cpp'] }
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	Plug 'kien/ctrlp.vim'

	Plug 'preservim/nerdcommenter'
call plug#end()

" disable ALE by default 
" let g:ale_linters_explicit = 1

let g:airline_powerline_fonts = 1


" Configure NerdCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" Configure Ctrl-P
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" Toggle display invisible characters
setlocal listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
func! InvisibleCharacters()
	setlocal list!
endfu
com! IC call InvisibleCharacters()
