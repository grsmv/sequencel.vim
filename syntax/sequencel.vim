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

" syntax/sequencel.vim: Vim syntax file for SeqeuenceL

" SequenceL is case sensitive
syn case match

" Keywords and directives
syn keyword    slDirective     public import
syn keyword    slKeyword       let in
syn keyword    slConditional   when else or & not
hi def link    slDirective     Statement
hi def link    slKeyword       Keyword
hi def link    slConditional   Conditional

" Built-in functions
syn keyword    slConstant      pi e
syn keyword    slBuiltin       some all none sum product mod floor sqrt ln sin cos tan asin acos
syn keyword    slBuiltin       atan subset eq_list eq_bag eq_set appends size head tail
syn keyword    slBuiltin       transpose takeaway remdups
hi def link    slConstant      Constant
hi def link    slBuiltin       Keyword

" Predefined types
syn keyword    slType          int float bool char
hi def link    slType          Type

" Comments
syn keyword    slTodo          contained TODO FIXME XXX BUG
syn cluster    slCommentGroup  contains=slTodo
syn region     slComment       start="/\*" end="\*/" contains=@goCommentGroup,@Spell
syn region     slComment       start="//" end="$" contains=@goCommentGroup,@Spell
hi def link    slComment       Comment
hi def link    slTodo          Comment

" Operators
syn match      slOperator      /->/
syn match      slOperator      /:=\|::=/
hi def link    slOperator      Number

" Strings
syn region     slString        start=+"+ end=+"+
hi def link    slString        String

" Characters; their contents
syn region     slCharacter     start=+'+ end=+'+
hi def link    slCharacter     Character

" Regions
syn region     slBlock         start="{" end="}" transparent fold
syn region     slParen         start="(" end=")" transparent

" Integers
syn match      slInteger       "\<\d\+\>"
hi def link    slInteger       Number

" Floating point
syn match      slFloat         "\<\d\+\.\d*\>"
hi def link    slFloat         Float

" Booleans
syn keyword    slBoolean       true false
hi def link    slBoolean       Boolean

let b:current_syntax = "SequenceL"
