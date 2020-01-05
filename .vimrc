" if exists('py2') && has('python')
" elseif has('python3')
" endif
" 
" set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" let Vundle manage Vundle, required
call plug#begin('~/.vim/plugged')

"filesystem
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim' 
Plug 'vim-scripts/taglist.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'

"syntax checker
Plug 'vim-syntastic/syntastic'

"auto-conpletion stuff
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"powerline
Plug  'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'

"color
Plug 'fatih/molokai'
Plug 'kamwitsta/nordisk'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'

" edit
"Plug 'mg979/vim-visual-multi'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
" All of your Plugs must be added before the following line
call plug#end()            " required

" termianl-setting
tnoremap <Esc> <C-W>N
set notimeout ttimeout timeoutlen=100

"split set
set splitbelow
set splitright 
"For full syntax highlighting
syntax on
set t_Co=256 
set term=xterm-256color

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
"set textwidth=108
set wrap
"set colorcolumn=110
set formatoptions=qrnl

"Search model
vnoremap / /\v                 
nnoremap / /\v
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

"Cancel search highlight
nnoremap <silent> mm :noh<CR>
""Use tab to match 
nnoremap <tab> %
vnoremap <tab> %

"Set the default file encoding to UTF-8
set encoding=utf-8

"Use UNIX line endings.
set fileformat=unix

"Make backspaces more powerfutl
set backspace=indent,eol,start

set modifiable
"auto use the vimrc after save.
autocmd bufwritepost .vimrc source %

"colorscheme
colorscheme nord

"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"map <space> <leader>
let mapleader = ","

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
"let airline#extensions#tabline#current_first = 1
"let g:airline_powerline_fonts = 1
let g:airline_theme = "bubblegum"


"NERDTree and NERDTree-tabs
map tt :NERDTreeTabsToggle<CR>
"Close window when only left ioen is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

"auto open errors
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_chechk_on_wq = 0
"Checker statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"taglist setting
"only show current file tags
let Tlist_Show_One_File=1
"close window when the only open is taglist
let Tlist_Exit_OnlyWindow=1
"open taglist on right window
let Tlist_Use_Right_Window=1
"ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"Use F4 to open taglist.
map <F4> :TlistToggle<CR>

let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'

" deoplete
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:deoplete#enable_at_startup = 1

" deoplete-go
let g:deoplete#sources#go#gocode_binary="/Users/aytrack/go/bin/gocode"

" golang
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 0
let g:go_def_mode = 'godef'
let g:go_auto_sameids = 0

" Clipboard 
vnoremap Y "*y
" add yaml stuffs
 au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
 autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab 

 " spell
 map <F6> :setlocal spell! spelllang=en_us<CR>

 " for gitgutter
 set updatetime=100

 "NERD comment
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
