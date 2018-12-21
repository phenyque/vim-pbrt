setlocal autoindent
setlocal indentexpr=PbrtIndent()
setlocal indentkeys+=d


function! PbrtIndent()
  let prevNum = v:lnum - 1
  if prevNum == 0
    return -1
  endif 

  let lastNonBlank = prevnonblank(v:lnum - 1)
  let currLine = substitute(getline(v:lnum), '#.*$', '', '')
  let currExpr = substitute(currLine, '[ \t]*', '', '')
  let prevLine = substitute(getline(prevNum), '#.*$', '', '')
  let prevExpr = substitute(prevLine, '[ \t]*', '', '')

  if currExpr =~ '[Attribute|World]End'
      return indent(v:lnum) - shiftwidth()
  endif

  if prevExpr =~ '[Attribute|World]Begin'
    return indent(lastNonBlank) + shiftwidth()
  endif

  return -1
endfunction
