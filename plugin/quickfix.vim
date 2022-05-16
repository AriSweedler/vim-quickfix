" Thanks, unimpaired.vim

"""""""""""""""""""""""""""""""" Quickfix """""""""""""""""""""""""""""""" {{{
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

nnoremap <Leader>qq :call QuickfixToggle()<CR>
nnoremap <Leader>qQ :cclose<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""""""""""""""""""""""""" Locationlist """""""""""""""""""""""""""""" {{{
" Locationlist gets more convenient mappings than quickfix. It is the
" preferred way. If you want to use the gloal quickfix, then go ahead. But
" this plugin doesn't encourage it.
nnoremap <silent> [l :try <Bar> :lprevious <Bar> catch <Bar> :lfirst <Bar> endtry<CR>zv
nnoremap <silent> ]l :try <Bar> :lnext <Bar> catch <Bar> :llast <Bar> endtry<CR>zv
nnoremap [L :lfirst<CR>zv
nnoremap ]L :llast<CR>zv
nnoremap <Leader>[l :lpfile<CR>zv
nnoremap <Leader>]l :lnfile<CR>zv

nnoremap <Leader>ll :call LocationListToggle()<CR>
nnoremap <Leader>lL :lclose<CR>

" Instantly invoke grep
" TODO make a wrapper function that does all this (AND populates the @/ register)
nnoremap <Leader>L :tabnew<CR>:lgrep ''<Left>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""""""""""""""""""" Useful command 'abbrev's """""""""""""""""""""""" {{{
cabbrev lgerp lgrep
cabbrev grep lgrep
cabbrev gerp lgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""" Like '*', but load search results into the quickfix list """""""" {{{
" Use '<Leader>*' to invoke '*' but with ':lgrep' instead of single file
nnoremap <silent> <Leader>* :set hlsearch<CR>g*:tabnew<CR>:lgrep! '<C-r>/'<CR>:lopen 15<CR><C-w>w
" Make it easier to invoke
nmap <silent> g* *<Leader>*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""""""" Functions to toggle quickfix list / location list """"""""""" {{{
function! QuickfixToggle()
  if (&buftype == "quickfix")
    cclose
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen 15
  endif
endfunction

function! LocationListToggle()
  " buftype of the location list is quickfix
  if (&buftype == "quickfix")
    lclose
    execute g:locationlist_return_to_window . "wincmd w"
    " call quickfix#signs#clear(winnr())
  else
    let g:locationlist_return_to_window = winnr()
    " call quickfix#signs#place(winnr())
    lopen 15
  endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}

" augroup quickfix_signs
"   autocmd!
"   autocmd QuickFixCmdPre call quickfix#signs#clear(winnr())
"   autocmd QuickFixCmdPost call quickfix#signs#place(winnr())
" augroup END
