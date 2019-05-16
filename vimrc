set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h16
set expandtab

set directory=$HOME/.vim/swapfiles

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

" Syntax specific settings
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType c setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType hcl setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
" Syntastic

let g:syntastic_python_checkers = []
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["rust"] }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp'

" Language Server

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })
endif
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif


if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

let g:lsp_diagnostics_enabled = 1
let g:lsp_auto_enable = 1
let g:lsp_preview_keep_focus = 1
let g:lsp_insert_text_enabled = 1

let g:asyncomplete_auto_popup = 1
