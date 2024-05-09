if !has('nvim')
    set ttymouse=xterm2
    set term=xterm-256color
endif
if has('nvim')
   tnoremap <Esc> <C-\><C-n>
endif
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif
" if exists('py2') && has('python')
" elseif has('python3')
" endif
" set nocompatible              " be iMproved, required
" filetype off                  " required

" Using vim-plug to manage plug.
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ 
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

"filesystem
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jlanzarotta/bufexplorer'
Plug 'cespare/vim-toml'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/vim-jsonnet'
Plug 'mechatroner/rainbow_csv'
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'

Plug 'Yggdroot/indentLine'


"syntax checker
Plug 'vim-syntastic/syntastic'

"rust
Plug 'rust-lang/rust.vim'
"powerline
Plug  'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'rfratto/vim-ginkgo-test'

"color
" Plug 'Sammyalhashe/random_colorscheme.vim'
Plug 'fatih/molokai'
Plug 'kamwitsta/nordisk'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'romainl/Apprentice'
Plug 'savq/melange-nvim'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'ribru17/bamboo.nvim'
Plug 'eihigh/vim-aomi-grayscale'

" edit
"Plug 'mg979/vim-visual-multi'
" Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'

"markdown
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim'

"SQL
Plug 'vim-scripts/dbext.vim'

"terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'akinsho/bufferline.nvim', { 'tag': '*' }


Plug 'ryanoasis/vim-devicons'
" All of your Plugs must be added before the following line
call plug#end()            " required

" require("hlchunk").setup({})

" termianl-setting
tnoremap <Esc> <C-W>N
set notimeout ttimeout timeoutlen=100

"split set
set splitbelow
set splitright 
"For full syntax highlighting
syntax on
set t_Co=256 

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
nnoremap <silent> cl :noh<CR>
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

" fold
set foldenable
" set foldmethod=syntax

"colorscheme
set termguicolors
colorscheme nord
if &diff
    colorscheme nord
endif

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
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '<>'
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
"let airline#extensions#tabline#current_first = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "bubblegum"

" clap
map cp :Clap <CR>
map cpf :Clap files<CR>
map cpb :Clap bcommits<CR>
map cph :Clap hist<CR>
map cpc :Clap commits<CR>
map cpdf :Clap git_diff_files<CR>
map cpg :Clap live_grep<CR>
" airline for gitgutter
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#keymap#enabled = 1
"NERDTree and NERDTree-tabs
map tt :NERDTreeToggle<CR>
"Close window when only left ioen is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

"auto open errors
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_chechk_on_wq = 0
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

"Checker statusline
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"tagbar
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
nmap <Leader>f :TagbarToggle<CR>
"
" let g:UltiSnipsSnippetDirectories=['UltiSnips']
" let g:UltiSnipsSnippetsDir = '~/.vim/plugged/ultisnips'
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'

" " deoplete
" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
" let g:deoplete#enable_at_startup = 1
"
" " deoplete-go
" let g:deoplete#sources#go#gocode_binary="/Users/aytrack/go/bin/gocode"

" golang
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']


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
let g:go_def_mode = 'gopls'
let g:go_auto_sameids = 0
let g:go_debug_log_output = 'debugger'

" Clipboard 
vnoremap Y "*y
" for yy 
 au! BufNewFile,BufReadPost *.{yy} set filetype=yy
 autocmd FileType yy setlocal ts=4 sts=4 sw=4 expandtab 
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


" python 
au BufNewFile,BufRead *.py
\ set tabstop=4   "tab宽度
\ set softtabstop=4 
\ set shiftwidth=4  
\ set expandtab       "tab替换为空格键
\ set autoindent      "自动缩进
\ set fileformat=unix   "保存文件格式

"ag search
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" coc
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
  inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()

function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" auto-pairs
 let g:AutoPairsShortcutToggle = '<C-a>'

set rtp+=/opt/homebrew/opt/fzf
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" snippets
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" ident
let g:indentLine_defaultGroup = 'SpecialKey'

set guifont=Hack_Nerd_Font:h11

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
