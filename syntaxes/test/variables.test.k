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
  }
variable:1
/ <-------- variable

.namespaced.function:{}
/ <-------------------- variable
.namespaced.variable:1
/ <-------------------- variable
