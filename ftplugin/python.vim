" Uses https://learnvimscriptthehardway.stevelosh.com/chapters/49.html as a
" reference.
"
" Folds python expressions at the top level in a nicer way than with 'indent'.

setlocal foldmethod=expr
setlocal foldexpr=GetPythonFold(v:lnum)

function! GetPythonFold(lnum)
  if getlin(a:lnum) =~? '\v^\s*$'
    return '+'
  endif

  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return next_indent
  endif
endfunction

function! IndentLevel(lnum)
  let actual_indent = indent(a:lnum) / &shiftwidth
  " foldnestmax is not used with foldexpr
  if &foldnestmax < actual_indent
    return &foldnestmax
  endif
  return actual_indent
endfunction

function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1
  
  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif

    let current += 1
  endwhile

  return -2
endfunction
