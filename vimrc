set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h16
set expandtab

set directory=$HOME/.vim/swapfiles

" Indention
set smartindent

" NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1

" Searching
set hlsearch 
set ignorecase
set smartcase

" Syntax specific settings
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
