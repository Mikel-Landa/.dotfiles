let g:mapleader = ' '  " Define space as leader key

"Save with <leader> + s
nnoremap <leader>s :w<CR>

"Open vimrc <leader> + e
nnoremap <leader>e :e $MYVIMRC<CR> 

" Use <leader> + y to copy to clipboard 
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Use <leader> + d to cut to clipboard 
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Use <leader> + p to paste from clipboard 
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P


" Buffers "{{{
" ---------------------------------------------------------------------

" Move to next buffer with <leader> + l
nnoremap <leader>l :bnext<CR>

" Move to previous buffer with <leader> + j
nnoremap <leader>j :bprevious<CR>

" Close current buffer with <leader> + q
nnoremap <leader>q :bdelete<CR>

"}}}

"" Allow saving of files as sudo
cmap w!! w !sudo tee > /dev/null %


" Center search
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
" Unless jump more than 5, don't add it to the jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'


" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

"Consistent pasting
nnoremap Y yg_

"Better editing of words (pure magic!!)
nnoremap cn *``cgn
nnoremap cN *``cgN
