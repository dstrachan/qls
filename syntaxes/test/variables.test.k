/ SYNTAX TEST "source.k"

function:{[arg1;arg2]
/ <-------- variable.k
/          ^^^^ variable.k
/               ^^^^ variable.k
  a:arg1+arg2;
/ ^ variable.k
/   ^^^^ variable.k
/        ^^^^ variable.k
  b:{x+y}[a;2];
/ ^ variable.k
/    ^ variable.k
/      ^ variable.k
/         ^ variable.k
/           ^ constant.numeric.k
  }
variable:1
/ <-------- variable.k
/        ^ constant.numeric.k

.namespaced.function:{}
/ <-------------------- variable.k
.namespaced.variable:1
/ <-------------------- variable.k
/                    ^ constant.numeric.k

1variable:1
/ <--------- -variable.k
/         ^ constant.numeric.k
