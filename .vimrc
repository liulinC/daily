set nocompatible              " be iMproved, required
filetype off                  " required
" set run time path for fuzzy find
set rtp+=/usr/local/opt/fzf

nnoremap <C-P> :FZF <CR>
nnoremap q qall <CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Install light line for color schema
Plugin 'itchyny/lightline.vim'
set laststatus=2
if !has('gui_running')
 set t_Co=256
endif

execute pathogen#infect()

" Install NerdTree 
" https://github.com/scrooloose/nerdtree
" Start NerdTree when vim start up
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" NERDTree config
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"open by defualt
autocmd vimenter * NERDTree
set splitbelow
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
let g:NERDTreeNodeDelimiter = "\u00a0"
"
Plugin 'jistr/vim-nerdtree-tabs'
map  <Leader><Right> :tabn<CR>
map  <Leader><Left> :tabp<CR>

map  <Leader>n  :tabnew<CR>

nnoremap  <Leader>d  <C-W>gF

hi T1 guibg=green ctermbg=green
hi T2 guibg=red ctermbg=red
hi T3 guibg=yellow ctermbg=yellow
nnoremap <Leader>1 :match T1 /<C-R><C-W>/ <CR>
nnoremap <Leader>2 :2match T2 /<C-R><C-W>/ <CR>
nnoremap <Leader>3 :3match T3 /<C-R><C-W>/ <CR>

" nnoremap <C-]> :ts <CR>
" for ctags, to list all match tags
" Edit vimr configuration file
nnoremap <Leader>ce :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>cr :source $MYVIMRC<CR>

Plugin 'eugen0329/vim-esearch'
" hi ESearchMatch ctermfg=black ctermbg=white guifg=#000000 guibg=#E6E6FA
" filetype plugin indent on
"syntax is very import to enable vim-search
"
syntax enable

"Plugin 'scrooloose/syntastic'
Plugin 'vim-syntastic/syntastic'
" Plugin to check the syntax
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <Leader>s :SyntasticToggleMode<CR>

function Py2()
  let g:syntastic_python_python_exec = '/usr/bin/python2.7'
endfunction

function Py3()
  let g:syntastic_python_python_exec = '/usr/local/bin/python3.7'
endfunction

call Py3()   " default to Py3 because I try to use it when possible

"" for multiple cursors configuration
"Plugin 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
""" Default mapping
"let g:multi_cursor_start_word_key      = '<C-m>'
"let g:multi_cursor_select_all_word_key = '<A-m>'
"let g:multi_cursor_start_key           = 'g<S-m>'
"let g:multi_cursor_select_all_key      = 'g<A-m>'
"let g:multi_cursor_next_key            = '<S-m>'
"let g:multi_cursor_prev_key            = '<S-m>'
"let g:multi_cursor_skip_key            = '<S-x>'
"let g:multi_cursor_quit_key            = '<Esc>'


" set grep
:nnoremap gr :grep -rniI <cword> * --exclude=tags<CR>
:nnoremap Gr :grep <cword> %:p:h/*<CR>
:nnoremap gR :grep '\b<cword>\b' * <CR>
:nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR> 
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" Your vimrc
filetype plugin indent on
syntax enable


" Vim needs to be built with Python scripting support, and must be
" able to find Merlin's executable on PATH.
if executable('ocamlmerlin') && has('python')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif

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
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 55f540a7a5140e2918008e5f1dbf3a4a ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/lin/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
"
"
" for ctags to show status bar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
command! -nargs=0 TagbarToggleStatusline call TagbarToggleStatusline()
 nnoremap <silent> <c-F12> :TagbarToggleStatusline<CR>
 function! TagbarToggleStatusline()
    let tStatusline = '%{exists(''*tagbar#currenttag'')?
             \tagbar#currenttag(''     [%s] '',''''):''''}'
    if stridx(&statusline, tStatusline) != -1
       let &statusline = substitute(&statusline, '\V'.tStatusline, '', '')
    else
       let &statusline = substitute(&statusline, '\ze%=%-', tStatusline, '')
    endif
 endfunction

map <leader>f :call getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW')) <CR> %%b

nnoremap <C-M> ddp
nnoremap <leader>rb :resize 40 <CR>
nnoremap <leader>rs :resize 10 <CR>


" for C#
Plugin'OmniSharp/omnisharp-vim'
let g:OmniSharp_start_server = 1
let g:OmniSharp_port = 2000
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_path = "/Users/lin/.omnisharp/omnisharp-roslyn/run"
"autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>

Plugin 'tmhedberg/SimpylFold' 
" Enable folding with the spacebar
nnoremap <space> za 
" Enable folding           
set foldmethod=indent      
set foldlevel=99           
set encoding=utf-8         

" For go
set backspace=indent,eol,start
let g:go_fmt_command = "goimports" "    # Run goimports along gofmt on each save
let g:go_auto_type_info = 1 "          # Automatically get signature/type info for object under cursor
au filetype go inoremap <buffer>. .<C-x><C-o>
au filetype go nnoremap <leader>gb :GoBuild<CR>
au filetype go nnoremap <leader>gr :GoRun<CR>

imap <c-d> <esc>ddi
imap <c-U> <esc>viwUi
imap <S-U> <esc>viwui
