/ SYNTAX TEST "source.k"

 this is a comment
/ <------------------ comment.block.start.k
 at the start of a file
/ <----------------------- comment.block.start.k
 and is ended by
/ <---------------- comment.block.start.k
 an expression
/ <-------------- comment.block.start.k

0N!"TEST"; /this is a comment
/ <-- constant.numeric.k
/  ^^^^^^ string.quoted.double.k
/          ^^^^^^^^^^^^^^^^^^ comment.line.k

0N!"TEST"; / this is a comment
/ <-- constant.numeric.k
/  ^^^^^^ string.quoted.double.k
/          ^^^^^^^^^^^^^^^^^^^ comment.line.k

/
/ <- comment.block.k
 this is a block comment
/ <------------------------ comment.block.k
\
/ <- comment.block.k

\
/ <- comment.block.trailing.k
this is a trailing comment
/ <-------------------------- comment.block.trailing.k
