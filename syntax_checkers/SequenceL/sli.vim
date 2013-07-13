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

" syntax_checkers/SequenceL/sli.vim: Vim file providing integration with Syntastic
"
" TODO:
"   * https://github.com/scrooloose/syntastic/wiki/Syntax-Checker-Guide
"   * https://github.com/scrooloose/syntastic/blob/master/syntax_checkers/haskell/ghc-mod.vim

if exists("g:loaded_syntastic_SequenceL_sli_checker")
    finish
endif

fun! SyntaxCheckers_SequenceL_sli_IsAvailable()
    return executable(g:sequencel_interpreter_path)
endfun

fun! SyntaxCheckers_SequenceL_sli_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ "exe":       g:sequencel_interpreter_path,
        \ "args":      "--quit --load" . @%,
        \ "filetype":  "SequenceL" })

    let errorformat =
        \ "ERROR: %m on line %l of file %f"

    return SyntasticMake({'makeprg': makeprg, 'errorformat': errorformat})
endfun

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ "filetype":  "SequenceL",
            \ "name":      "sli" })

" vim: noai:ts=4:sw=4
