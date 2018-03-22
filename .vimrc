set nocompatible              " required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
"
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " requiredo
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'eugen0329/vim-esearch'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

set clipboard=unnamed
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" NERDTree config
  map <F2> :NERDTreeToggle<CR>
   autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
   "open by defualt
   autocmd vimenter * NERDTree

call togglebg#map("<F5>")

map  <F3> :tabn<CR>
map  <F4> :tabp<CR>
map  <C-n> :tabnew<CR>

:nnoremap gr :grep -rn <cword> * --exclude=tags<CR>
:nnoremap Gr :grep <cword> %:p:h/*<CR>
:nnoremap gR :grep '\b<cword>\b' * <CR>
:nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

let python_highlight_all=1
syntax on
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"
au BufNewFile,BufRead *.py
			\set tabstop=4
			\set softtabstop=4 
			\set shiftwidth=4
			\set textwidth=79
			\set expandtab 
			\set autoindent
			\set fileformat=unix

" au BufRead,BufNewFile *.py, *.pyw, *.c, *,h  match BadWhitespace /\s\+$/ 
set splitbelow
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
set encoding=utf-8

" Enable folding with the spacebar
nnoremap <space> za

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
     execute "set rtp+=" . g:opamshare . "/merlin/vim"

set number
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor

filetype plugin indent on
syntax enable

" Vim needs to be built with Python scripting support, and must be
" able to find Merlin's executable on PATH.
if executable('ocamlmerlin') && has('python')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '','''') . "/ocamlmerlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif
"
" ## end of OPAM user-setup addition for vim / base ## keep this line
"
"
