" Like '*', but load search results into the quickfix list
nnoremap <silent> <Leader>* :set hlsearch<CR>g*:tabnew<CR>:lgrep! '<C-r>/'<CR>:lopen 15<CR><C-w>w

" Make it easier to invoke
nmap <silent> g* *<Leader>*
