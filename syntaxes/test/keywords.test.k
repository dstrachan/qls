/ SYNTAX TEST "source.k"

\d .
/ <-- keyword.system.k
\d . /this is a comment
/ <-- keyword.system.k
/    ^^^^^^^^^^^^^^^^^^ comment.line.k
\d .Q
/ <-- keyword.system.k
\d .Q /this is a comment
/ <-- keyword.system.k
/     ^^^^^^^^^^^^^^^^^^ comment.line.k

\ls -ld file1.txt file2.txt
/ <--------------------------- keyword.system.k
\ls -l . /this is not a comment
/ <------------------------------- keyword.system.k
/        ^^^^^^^^^^^^^^^^^^^^^^ -comment.line

abs
/ <--- keyword.k
acos
/ <---- keyword.k
asin
/ <---- keyword.k
atan
/ <---- keyword.k
avg
/ <--- keyword.k
bin
/ <--- keyword.k
binr
/ <---- keyword.k
cor
/ <--- keyword.k
cos
/ <--- keyword.k
cov
/ <--- keyword.k
dev
/ <--- keyword.k
div
/ <--- keyword.k
enlist
/ <------ keyword.k
exit
/ <---- keyword.k
exp
/ <--- keyword.k
getenv
/ <------ keyword.k
hopen
/ <---- keyword.k
in
/ <-- keyword.k
insert
/ <------ keyword.k
last
/ <---- keyword.k
like
/ <---- keyword.k
log
/ <--- keyword.k
max
/ <--- keyword.k
min
/ <--- keyword.k
prd
/ <--- keyword.k
setenv
/ <------ keyword.k
sin
/ <--- keyword.k
sqrt
/ <---- keyword.k
ss
/ <-- keyword.k
sum
/ <--- keyword.k
tan
/ <--- keyword.k
var
/ <--- keyword.k
wavg
/ <---- keyword.k
within
/ <------ keyword.k
wsum
/ <---- keyword.k
xexp
/ <---- keyword.k

do
/ <-- keyword.control.k
if
/ <-- keyword.control.k
while
/ <----- keyword.control.k

delete
/ <------ keyword.sql.k
exec
/ <---- keyword.sql.k
select
/ <------ keyword.sql.k
update
/ <------ keyword.sql.k

.z.D
/ <---- variable.language.k
.z.K
/ <---- variable.language.k
.z.N
/ <---- variable.language.k
.z.P
/ <---- variable.language.k
.z.T
/ <---- variable.language.k
.z.W
/ <---- variable.language.k
.z.X
/ <---- variable.language.k
.z.Z
/ <---- variable.language.k
.z.a
/ <---- variable.language.k
.z.ac
/ <----- variable.language.k
.z.b
/ <---- variable.language.k
.z.bm
/ <----- variable.language.k
.z.c
/ <---- variable.language.k
.z.d
/ <---- variable.language.k
.z.e
/ <---- variable.language.k
.z.ex
/ <----- variable.language.k
.z.exit
/ <------- variable.language.k
.z.ey
/ <----- variable.language.k
.z.f
/ <---- variable.language.k
.z.h
/ <---- variable.language.k
.z.i
/ <---- variable.language.k
.z.k
/ <---- variable.language.k
.z.l
/ <---- variable.language.k
.z.n
/ <---- variable.language.k
.z.o
/ <---- variable.language.k
.z.p
/ <---- variable.language.k
.z.pc
/ <----- variable.language.k
.z.pd
/ <----- variable.language.k
.z.pg
/ <----- variable.language.k
.z.ph
/ <----- variable.language.k
.z.pi
/ <----- variable.language.k
.z.pm
/ <----- variable.language.k
.z.po
/ <----- variable.language.k
.z.pp
/ <----- variable.language.k
.z.pq
/ <----- variable.language.k
.z.ps
/ <----- variable.language.k
.z.pw
/ <----- variable.language.k
.z.q
/ <---- variable.language.k
.z.s
/ <---- variable.language.k
.z.t
/ <---- variable.language.k
.z.ts
/ <----- variable.language.k
.z.u
/ <---- variable.language.k
.z.vs
/ <----- variable.language.k
.z.w
/ <---- variable.language.k
.z.wc
/ <----- variable.language.k
.z.wo
/ <----- variable.language.k
.z.ws
/ <----- variable.language.k
.z.x
/ <---- variable.language.k
.z.z
/ <---- variable.language.k
.z.zd
/ <----- variable.language.k
