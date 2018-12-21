setlocal autoindent
setlocal indentexpr=PbrtIndent()
setlocal indentkeys+=d

"function! PbrtIndent()
  "let lastNonBlank = prevNonBlank(v:lnum - 1)
  "if lastNonBlank == 0
    "" we are at the top of a file, no indent here
    "return 0
  "endif
  "let prevNum = v:lnum - 1

  "" strip comments from previous and current line
  "let lastNonBlankLine = substitute(getline(lastNonBlank), '#.*$', '', '')
  "let prevLine = substitute(getline(prevNum), '#.*$', '', '')
  "let currentLine = substitute(getline(v:lnum), '#.*$', '', '')
  "let prevIndent = indent(prevNum)

  "if prevLine =~ '^[ \t]*[Attribute|World]\+Begin[ \t]*$'
    "let retIndent = prevIndent + &shiftwidth
  "endif
  "if currentLine =~ '^[ \t]*[a-zA-Z]\+End[ \t]*$'
    "let retIndent = prevIndent - &shiftwidth
  "endif

  "return -1

"endfunction

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
