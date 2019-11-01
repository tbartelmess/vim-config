set guifont=SF\ Mono:h16

set expandtab
set directory=$HOME/.vim/swapfiles
syntax on
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
  set background=dark
  colorscheme spacegray
else
  set background=light
  if has("gui_running")
  colorscheme macvim
  endif
endif

" Enable line number
set number

" Indention
set smartindent
set noautoindent
filetype indent on

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1

" Searching
set hlsearch 
set ignorecase
set smartcase

" Set shiftwidth to 4 by default
set shiftwidth=4 

" Touchbar setup

:an TouchBar.Reload\ \~\.vimrc          :source ~/.vimrc<CR>


" Syntax specific settings
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType c setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType hcl setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType makefile setlocal noexpandtab
" Syntastic

let g:syntastic_python_checkers = []
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["rust"] }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp'

" Language Server

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

