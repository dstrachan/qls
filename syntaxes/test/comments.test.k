/ SYNTAX TEST "source.k"

 this is a comment
/ <------------------ comment.block.start
 at the start of a file
/ <----------------------- comment.block.start
 and is ended by
/ <---------------- comment.block.start
 an expression
/ <-------------- comment.block.start

0N!"TEST"; /this is a comment
/ <-- constant.numeric
/  ^^^^^^ string.quoted.double
/          ^^^^^^^^^^^^^^^^^^ comment.line

0N!"TEST"; / this is a comment
/ <-- constant.numeric
/  ^^^^^^ string.quoted.double
/          ^^^^^^^^^^^^^^^^^^^ comment.line

/
/ <- comment.block
 this is a block comment
/ <------------------------ comment.block
\
/ <- comment.block

\
/ <- comment.block.trailing
this is a trailing comment
/ <-------------------------- comment.block.trailing
