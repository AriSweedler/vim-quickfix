" Use '\la' to add to the locationlist
nnoremap <silent> <Leader>la :laddexpr expand("%") .. ":" .. line(".") ..  ":" .. getline(".")<CR>

" The opposite of '\la' is 'X' while in the locationlist. It could be nice to
" be able to delete the line from the locationlist while in the main buffer.
" Would have to select a line of text, go to locationlist, find the analogous
" line, delete it, and then go back to the main buffer.
