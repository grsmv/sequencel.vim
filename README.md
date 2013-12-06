### sequencel.vim ###

This project contains Vim plugin for editing SequenceL code with Vim. 

##### Installation #####

1. Install it as regular Vim plugin or as [Vundle](https://github.com/gmarik/vundle) bundle.
2. Specify path to SequenceL interpreter at `g:sequencel_interpreter_path`
   variable in your .vimrc.

##### Features #####

- Syntax highlighting
- Improved intendation
- Autocompletion (`<C-x C-o>`) for built-in functions, operators and keywords
- Executing command under cursor (`<Leader se>`)

![Exec](http://grsmv.com/images/sequencel.vim/executing_function_under_cursor.png)

##### What's SequenceL? #####

SequenceL is a general purpose functional programming language, whose primary design objectives are performance on multicore hardware, ease of programming, and code clarity/readability.

Please read [Wikipedia](http://en.wikipedia.org/wiki/SequenceL) and [TMT website](http://www.texasmulticoretechnologies.com/technology/sequenceL/) for more information.

##### Todo ######

1. Displaying errors with [Syntastic](https://github.com/scrooloose/syntastic)
1. Scientific notation for Numbers and Floats
1. Add standart functions: `asciiToInt`, `intToAscii`, `removeDups`, `join`
1. Rename built-in functions:
   1. eq_list → equalList
   2. eq_bag → equalBag
   3. eq_set → equalSet
   4. takeaway → takeAway
   5. remdups → removeDuplicates
   6. appends → join
1. `and` keyword highlighting
