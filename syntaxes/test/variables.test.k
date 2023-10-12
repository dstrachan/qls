/ SYNTAX TEST "source.k"

function:{[arg1;arg2]
/ <-------- variable
/          ^^^^ variable
/               ^^^^ variable
  a:arg1+arg2;
/ ^ variable
/   ^^^^ variable
/        ^^^^ variable
  b:{x+y}[a;2];
/ ^ variable
/    ^ variable
/      ^ variable
/         ^ variable
/           ^ constant.numeric
  }
variable:1
/ <-------- variable
/        ^ constant.numeric

.namespaced.function:{}
/ <-------------------- variable
.namespaced.variable:1
/ <-------------------- variable
/                    ^ constant.numeric

1variable:1
/ <--------- -variable
/         ^ constant.numeric
