set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
set mouse=a
nnoremap <space> za

autocmd FileType html,xhtml,css,javascript,python,sh set nospell

autocmd FileType python set textwidth=80
autocmd FileType python set makeprg=pep8\ %
autocmd FileType python set errorformat=%f:%l:%c:\ %m
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set expandtab
"autocmd FileType python set tabstop=4
autocmd FileType python iabbrev trace from pdb import set_trace; set_trace()


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate.csh')
  os.system('source' + 'activate_this') 
  #execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on



let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


set nu
set clipboard=unnamed
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"au BufNewFile,BufRead *.py
 "   \ set tabstop=4
    "\ setlocal softtabstop=4
    "\setlocal shiftwidth=4
    "\ setlocal textwidth=79
    "\ setlocal expandtab
    "\ setlocal autoindent
    "\ setlocal fileformat=unix
colorscheme murphy
