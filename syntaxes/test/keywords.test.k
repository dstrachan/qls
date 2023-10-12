/ SYNTAX TEST "source.k"

\d .
/ <---- keyword.directory
\d . /this is a comment
/ <---- keyword.directory
/    ^^^^^^^^^^^^^^^^^^ comment.line
\d .Q
/ <----- keyword.directory
\d .Q /this is a comment
/ <----- keyword.directory
/     ^^^^^^^^^^^^^^^^^^ comment.line

\ls -ld file1.txt file2.txt
/ <--------------------------- keyword.system
\ls -l . /this is not a comment
/ <------------------------------- keyword.system
/        ^^^^^^^^^^^^^^^^^^^^^^ -comment.line

abs
/ <--- keyword
acos
/ <---- keyword
asin
/ <---- keyword
atan
/ <---- keyword
avg
/ <--- keyword
bin
/ <--- keyword
binr
/ <---- keyword
cor
/ <--- keyword
cos
/ <--- keyword
cov
/ <--- keyword
dev
/ <--- keyword
div
/ <--- keyword
enlist
/ <------ keyword
exit
/ <---- keyword
exp
/ <--- keyword
getenv
/ <------ keyword
hopen
/ <---- keyword
in
/ <-- keyword
insert
/ <------ keyword
last
/ <---- keyword
like
/ <---- keyword
log
/ <--- keyword
max
/ <--- keyword
min
/ <--- keyword
prd
/ <--- keyword
setenv
/ <------ keyword
sin
/ <--- keyword
sqrt
/ <---- keyword
ss
/ <-- keyword
sum
/ <--- keyword
tan
/ <--- keyword
var
/ <--- keyword
wavg
/ <---- keyword
within
/ <------ keyword
wsum
/ <---- keyword
xexp
/ <---- keyword

do
/ <-- keyword.control
if
/ <-- keyword.control
while
/ <----- keyword.control

delete
/ <------ keyword.sql
exec
/ <---- keyword.sql
select
/ <------ keyword.sql
update
/ <------ keyword.sql

.z.D
/ <---- variable.language
.z.K
/ <---- variable.language
.z.N
/ <---- variable.language
.z.P
/ <---- variable.language
.z.T
/ <---- variable.language
.z.W
/ <---- variable.language
.z.X
/ <---- variable.language
.z.Z
/ <---- variable.language
.z.a
/ <---- variable.language
.z.ac
/ <----- variable.language
.z.b
/ <---- variable.language
.z.bm
/ <----- variable.language
.z.c
/ <---- variable.language
.z.d
/ <---- variable.language
.z.e
/ <---- variable.language
.z.ex
/ <----- variable.language
.z.exit
/ <------- variable.language
.z.ey
/ <----- variable.language
.z.f
/ <---- variable.language
.z.h
/ <---- variable.language
.z.i
/ <---- variable.language
.z.k
/ <---- variable.language
.z.l
/ <---- variable.language
.z.n
/ <---- variable.language
.z.o
/ <---- variable.language
.z.p
/ <---- variable.language
.z.pc
/ <----- variable.language
.z.pd
/ <----- variable.language
.z.pg
/ <----- variable.language
.z.ph
/ <----- variable.language
.z.pi
/ <----- variable.language
.z.pm
/ <----- variable.language
.z.po
/ <----- variable.language
.z.pp
/ <----- variable.language
.z.pq
/ <----- variable.language
.z.ps
/ <----- variable.language
.z.pw
/ <----- variable.language
.z.q
/ <---- variable.language
.z.s
/ <---- variable.language
.z.t
/ <---- variable.language
.z.ts
/ <----- variable.language
.z.u
/ <---- variable.language
.z.vs
/ <----- variable.language
.z.w
/ <---- variable.language
.z.wc
/ <----- variable.language
.z.wo
/ <----- variable.language
.z.ws
/ <----- variable.language
.z.x
/ <---- variable.language
.z.z
/ <---- variable.language
.z.zd
/ <----- variable.language
