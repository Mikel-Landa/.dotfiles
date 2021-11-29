if exists('g:vscode') | finish | endif
lua require('commented').setup()

" nnoremap <C-k> lua require('commented').toggle_comment(mode)
