" https://www.youtube.com/watch?v=vB3NT9QIXo8
" https://gist.github.com/BoltsJ/5942ecac7f0b0e9811749ef6e19d2176

" Code {{{1
" Public API {{{2
" Place all signs {{{3
function! quickfix#signs#place(winnr) abort
  for l:item in getloclist(a:winnr)
    call s:place_sign_from_qf_entry(l:item)
  endfor
endfunction

" Clear all signs {{{3
function! quickfix#signs#clear(winnr)
  sign unplace *
endfunction

" Private {{{2
" Place a single sign from a qf entry {{{3
function! s:place_sign_from_qf_entry(entry)
  if a:entry->get('valid', 0) == 0
    ""echom "DEBUG: Cannot place sign for invalid qf entry ".string(a:entry)
    return
  endif

  let l:lnum = a:entry->get('lnum', -1)
  if l:lnum == -1
    ""echom "DEBUG: Cannot place sign without an 'lnum' ".string(a:entry)
    return
  endif

  let l:bufnr = a:entry->get('bufnr', -1)
  if l:bufnr <= 0
    ""echom "DEBUG: Cannot place sign with non-integer bufnr ".string(a:entry)
    return
  endif

  " TODO read through ':help sign'
  " do we want to use 'group' or 'priority'?
  " Then we could just say ':sign unplace * group={group} file={fname}'
  let l:cmd  = 'sign place '.s:next_sign_id()
  let l:cmd .= ' line='.l:lnum
  let l:cmd .= ' name='.s:entry_to_name(a:entry)
  let l:cmd .= ' buffer='.l:bufnr
  execute l:cmd
endfunction

" Get the next sign ID. Needs to be unique per window {{{3
" TODO scope this per winnr
let s:counter = 0
function! s:next_sign_id()
  let s:counter += 1
  return s:counter
endfunction

" Determing what type of mark to use for a qf entry {{{3
" Define marks {{{4
sign define QFErr texthl=QFErrMarker text=E
sign define QFWarn texthl=QFWarnMarker text=W
sign define QFInfo texthl=QFInfoMarker text=I
sign define QFDefault texthl=QFInfoMarker text=X
" Highlights {{{4
highlight link QFErrMarker DiffDelete
highlight link QFWarnMarker DiffChange
highlight link QFInfoMarker DiffAdd
highlight link QFDefault DiffChange
" Map from entry to mark type {{{4
let s:entry_to_name_impl = #{E: 'QFErr', W: 'QFWarn', I: 'QFInfo', X: 'QFDefault'}
function! s:entry_to_name(entry)
  let type = a:entry->get('type', 'X')
  return s:entry_to_name_impl->get(type, 'QFDefault')
endfunction
