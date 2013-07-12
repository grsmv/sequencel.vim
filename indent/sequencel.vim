" Copyright (C) 2013 Serge Gerasimov <sgeras@softserveinc.com>

" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the 'Software'),
" to deal in the Software without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distribute, sublicense,
" and/or sell copies of the Software, and to permit persons to whom the
" Software is furnished to do so, subject to the following conditions:

" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.

" THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS
" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
" IN THE SOFTWARE.

" indent/sequencel.vim: Vim indent file for SequenceL

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" default settings
setlocal nolisp
setlocal autoindent
setlocal indentexpr=SlIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=)

if exists("*SlIndent")
    finish
endif

function! SlIndent(lnum)
    let prevlnum = prevnonblank(a:lnum-1)

    " top of file
    if prevlnum == 0
        return 0
    endif

    " grab the previous and current line, stripping comments.
    let prevl = substitute(getline(prevlnum), '//.*$', '', '')
    let thisl = substitute(getline(a:lnum), '//.*$', '', '')
    let previ = indent(prevlnum)

    let ind = previ

    " previous line opened a block
    if prevl =~ '[({]\s*$'
        let ind += &sw
    endif

    " this line closed a block
    if thisl =~ '^\s*[)}]'
        let ind -= &sw
    endif

    " if previous line begins to declare a statement
    if prevl =~ '.*[:=|::=].*'
        let ind += &sw
    endif

    " if previous line end with semicolon (statement finish)
    if prevl =~ '.*;.*'
        let ind -= &sw
    endif

    return ind
endfunction
