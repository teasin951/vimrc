set nocompatible
set clipboard=unnamedplus
filetype plugin on

set nu
set autoindent

set hidden

call plug#begin()
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'powerline/powerline'

	Plug 'dense-analysis/ale', { 'for': ['c', 'python', 'sh'] }

	Plug 'Raimondi/delimitMate', { 'for': ['c', 'python', 'sh'] }
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	Plug 'kien/ctrlp.vim'
call plug#end()

let g:airline_powerline_fonts = 1


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
