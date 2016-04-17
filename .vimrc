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
Plugin 'flazz/vim-colorschemes'
Bundle 'vim-scripts/MatlabFilesEdition'
call vundle#end()
filetype plugin indent on
set textwidth=80

"Mapping for moving across windows in vim 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable arrow keys to learn vim better 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"set mouse=a
set expandtab "insert space 
set tabstop=4 "no of tabs is 4
autocmd! bufwritepost .vimrc source % "auto-reload changes in vimrc"
set hlsearch "high search results
autocmd FileType html,xhtml,css,javascript,python,sh set nospell

autocmd FileType python set textwidth=80
autocmd FileType python set makeprg=pep8\ %
autocmd FileType python set errorformat=%f:%l:%c:\ %m
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set expandtab
"autocmd FileType python set tabstop=4
autocmd FileType python iabbrev trace from pdb import set_trace; set_trace()


"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

"For python synntax highlighting syntastic package
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"if has('gui_running')
  "set background=dark
 "  colorscheme zenburn
"else
 " colorscheme zenburn
"endif

colorscheme blackboard 
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore pycfiles in NERDTree

set nu
set clipboard=unnamed

au VimEnter * NERDTree


"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


