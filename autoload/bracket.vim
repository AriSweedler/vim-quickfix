function bracket#quickfix_left()
  if getqflist() == []
    echo "quickfixlist is empty - returning"
    return
  endif

  try
    cprevious
  catch
    cfirst
  endtry
  normal zv
endfunction

function bracket#quickfix_right()
  if getqflist() == []
    echo "quickfixlist is empty - returning"
    return
  endif

  try
    cnext
  catch
    clast
  endtry
  normal zv
endfunction

function bracket#locationlist_left()
  if getloclist(0) == []
    call feedkeys("[q")
    echo "locationlist is empty - sending [q"
    return
  endif

  try
    lprevious
  catch
    lfirst
  endtry
  normal zv
endfunction

function bracket#locationlist_right()
  if getloclist(0) == []
    call feedkeys("]q")
    echo "locationlist is empty - sending ]q"
    return
  endif

  try
    lnext
  catch
    llast
  endtry
  normal zv
endfunction
