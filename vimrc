if exists('py2') && has('python')
elseif has('python3')
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 
Plugin 'vim-scripts/taglist.vim'
Plugin 'tpope/vim-fugitive'

"syntax checker
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'hdima/python-syntax'

"html
"Plugin 'mattn/emmet-vim'

"auto-conpletion stuff
Plugin 'Valloric/YouCompleteMe'

"python
"Plugin 'jmcantrell/vim-virtualenv'
Plugin 'davidhalter/jedi-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tell-k/vim-autopep8'

"powerline
Plugin 'Lokaltog/vim-powerline', {'rtp': 'powerline/bindings/vim/'}


"color
Plugin 'kamwitsta/nordisk'
Plugin 'dracula/vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required

"split set
set splitbelow
set splitright

"For full syntax highlighting
syntax on
set t_Co=256 

"python highlighting
let python_highlight_all = 1

"Enables filetype detection
filetype on
filetype plugin indent on

"No swap files
set noswapfile

"Turn on numbering
set nu

"Set relative numver
set relativenumber

"Set the mouse
set mouse=v

"Number of spaces that a pre-existing tab is equal to.
set tabstop=4

"spaces for indents
set shiftwidth=4
set expandtab
set softtabstop=4

"Keep indentation level from previous line
set autoindent

"Wrap text after a certain number of characters
set textwidth=79

"Set the default file encoding to UTF-8
set encoding=utf-8

"Use UNIX line endings.
set fileformat=unix

"Make backspaces more powerfull
set backspace=indent,eol,start

set modifiable
"auto use the vimrc after save.
"autocmd bufwritepost .vimrc source %

"colorschema
colorscheme dracula

"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"Set the leader key to space
let mapleader=" "

"powerline 
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
set laststatus=2
let g:Powerline_colorscheme='solarized256'

"NERDTree and NERDTree-tabs
"F3 to open all tabs NERDTree
map <F3> :NERDTreeTabsToggle<CR>
"leader-t to open current tabs NERDTree
"map <leader>t :NERDTreeToggle<CR>
"Close window when only left ioen is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

"set emmet leader key
let g:user_emmet_leader_key='<C-M>' 

"python checker
let g:syntastic_python_checkers=['flake8']
"auto open errors
let g:syntastic_auto_loc_list = 1

"Auto close preview
"let g:ycm_autoclose_preview_window_after_completion=1
map <leader>b  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"taglist setting
"only show current file tags
let Tlist_Show_One_File=1
"close window when the only open is taglist
let Tlist_Exit_OnlyWindow=1
"open taglist on right window
let Tlist_Use_Right_Window=1
"ctags
let Tlist_Ctags_Cmd='/usr/bin/ctags'
"Use F4 to open taglist.
map <F4> :TlistToggle<CR>

"UltiSnips setting
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'

" make YCM compatible with UltiSnips 
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
