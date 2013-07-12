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

" autoload/sequencel.vim: Vim file providing OmniCompletion for SequenceL files

fun! sequencel#Complete (findstart, base)
    let dictionary = "
          \ & * + ++ - / /= < <= = > >= ^
          \ acos all appends asin atan cos e else eq_bag eq_list eq_set
          \ floor head import in let ln mod mod none not or or pi product public
          \ remdups sin sin size some sqrt subset sum
          \ tail takeaway tan tan transpose when"

    if a:findstart
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        return start
    else
        " find word matching with "a:base"
        let res = []
        for m in split(dictionary)
            if m =~ '^' . a:base
                call add(res, m)
            endif
        endfor
        return res
    endif
endfun

