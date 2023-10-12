/ SYNTAX TEST "source.k"

/ io
0:`test.csv
/ <-- constant.language
/ ^^^^^^^^^ entity.name.type
data:0:`test.csv
/ <---- variable
/    ^^ constant.language
/      ^^^^^^^^^ entity.name.type
`test.csv 0:0:`test.csv
/ <--------- entity.name.type
/         ^^ constant.language
/           ^^ constant.language
/             ^^^^^^^^^ entity.name.type
`test.csv 0:data:0:`test.csv
/ <--------- entity.name.type
/         ^^ constant.language
/           ^^^^ variable
/                ^^ constant.language
/                  ^^^^^^^^^ entity.name.type
00:`test.csv
/ <--- -constant.language
/  ^^^^^^^^^ entity.name.type

1:`test
/ <-- constant.language
/ ^^^^^ entity.name.type
data:1:`test
/ <---- variable
/    ^^ constant.language
/      ^^^^^ entity.name.type
`test 1:1:`test
/ <----- entity.name.type
/     ^^ constant.language
/       ^^ constant.language
/         ^^^^^ entity.name.type
`test 1:data:1:`test
/ <----- entity.name.type
/     ^^ constant.language
/       ^^^^ variable
/            ^^ constant.language
/              ^^^^^ entity.name.type
01:`test
/ <--- -constant.language
/  ^^^^^ entity.name.type

fun:`test 2:(`fun;1)
/ <--- variable
/   ^^^^^ entity.name.type
/         ^^ constant.language
/            ^^^^ entity.name.type
/                 ^ constant.numeric
02:(`fun;1)
/ <--- -constant.language
/   ^^^^ entity.name.type
/        ^ constant.numeric

/ boolean
0b
/ <-- constant.numeric
1b
/ <-- constant.numeric
00b
/ <--- constant.numeric
01b
/ <--- constant.numeric
10b
/ <--- constant.numeric
11b
/ <--- constant.numeric

/ guid
0Ng
/ <--- constant.numeric
0ng
/ <--- constant.numeric

/ byte
0x
/ <-- constant.numeric
0x0
/ <--- constant.numeric
0x00
/ <---- constant.numeric
0x0123456789abcdefABCDEF
/ <------------------------ constant.numeric

/ short
0123456789h
/ <----------- constant.numeric
0Nh
/ <--- constant.numeric
0nh
/ <--- constant.numeric
0Wh
/ <--- constant.numeric
-0Wh
/ <---- constant.numeric
0wh
/ <--- constant.numeric
-0wh
/ <---- constant.numeric

/ int
0123456789i
/ <----------- constant.numeric
0Ni
/ <--- constant.numeric
0ni
/ <--- constant.numeric
0Wi
/ <--- constant.numeric
-0Wi
/ <---- constant.numeric
0wi
/ <--- constant.numeric
-0wi
/ <---- constant.numeric

/ long
0123456789
/ <----------- constant.numeric
0123456789j
/ <----------- constant.numeric
0N
/ <------------ constant.numeric
0Nj
/ <--- constant.numeric
0nj
/ <--- constant.numeric
0W
/ <-- constant.numeric
-0W
/ <--- constant.numeric
0Wj
/ <--- constant.numeric
-0Wj
/ <---- constant.numeric
0wj
/ <--- constant.numeric
-0wj
/ <--- constant.numeric

/ real
0123456789e
/ <----------- constant.numeric
.0123456789e
/ <------------ constant.numeric
0123456789.e
/ <------------ constant.numeric
0123456789.0123456789e
/ <---------------------- constant.numeric
0123456789e0123456789e
/ <---------------------- constant.numeric
0123456789e+0123456789e
/ <----------------------- constant.numeric
0123456789e-0123456789e
/ <----------------------- constant.numeric
.0123456789e0123456789e
/ <----------------------- constant.numeric
.0123456789e+0123456789e
/ <------------------------ constant.numeric
.0123456789e-0123456789e
/ <------------------------ constant.numeric
0123456789.e0123456789e
/ <----------------------- constant.numeric
0123456789.e+0123456789e
/ <------------------------ constant.numeric
0123456789.e-0123456789e
/ <------------------------ constant.numeric
0123456789.0123456789e0123456789e
/ <--------------------------------- constant.numeric
0123456789.0123456789e+0123456789e
/ <---------------------------------- constant.numeric
0123456789.0123456789e-0123456789e
/ <---------------------------------- constant.numeric
0Ne
/ <--- constant.numeric
0ne
/ <--- constant.numeric
0We
/ <--- constant.numeric
-0We
/ <---- constant.numeric
0we
/ <--- constant.numeric
-0we
/ <---- constant.numeric

/ float
0123456789f
/ <----------- constant.numeric
.0123456789
/ <----------- constant.numeric
.0123456789f
/ <------------ constant.numeric
0123456789.
/ <----------- constant.numeric
0123456789.f
/ <------------ constant.numeric
0123456789.0123456789
/ <--------------------- constant.numeric
0123456789.0123456789f
/ <---------------------- constant.numeric
0123456789e0123456789
/ <--------------------- constant.numeric
0123456789e+0123456789
/ <---------------------- constant.numeric
0123456789e-0123456789
/ <---------------------- constant.numeric
0123456789e0123456789f
/ <---------------------- constant.numeric
0123456789e+0123456789f
/ <----------------------- constant.numeric
0123456789e-0123456789f
/ <----------------------- constant.numeric
.0123456789e0123456789
/ <---------------------- constant.numeric
.0123456789e+0123456789
/ <----------------------- constant.numeric
.0123456789e-0123456789
/ <----------------------- constant.numeric
.0123456789e0123456789f
/ <----------------------- constant.numeric
.0123456789e+0123456789f
/ <------------------------ constant.numeric
.0123456789e-0123456789f
/ <------------------------ constant.numeric
0123456789.e0123456789
/ <---------------------- constant.numeric
0123456789.e+0123456789
/ <----------------------- constant.numeric
0123456789.e-0123456789
/ <----------------------- constant.numeric
0123456789.e0123456789f
/ <----------------------- constant.numeric
0123456789.e+0123456789f
/ <------------------------ constant.numeric
0123456789.e-0123456789f
/ <------------------------ constant.numeric
0123456789.0123456789e0123456789
/ <-------------------------------- constant.numeric
0123456789.0123456789e+0123456789
/ <--------------------------------- constant.numeric
0123456789.0123456789e-0123456789
/ <--------------------------------- constant.numeric
0123456789.0123456789e0123456789f
/ <--------------------------------- constant.numeric
0123456789.0123456789e+0123456789f
/ <---------------------------------- constant.numeric
0123456789.0123456789e-0123456789f
/ <---------------------------------- constant.numeric
0Nf
/ <--- constant.numeric
0n
/ <-- constant.numeric
0nf
/ <--- constant.numeric
0Wf
/ <--- constant.numeric
-0Wf
/ <---- constant.numeric
0w
/ <-- constant.numeric
-0w
/ <--- constant.numeric
0wf
/ <--- constant.numeric
-0wf
/ <---- constant.numeric

/ char
"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
/ <------------------------------------------------------ string.quoted.double
0123456789c
/ <-- constant.numeric
-0123456789c
/ <-- constant.numeric
0Nc
/ <--- constant.numeric
0nc
/ <--- constant.numeric
0Wc
/ <--- constant.numeric
-0Wc
/ <---- constant.numeric
0wc
/ <--- constant.numeric
-0wc
/ <---- constant.numeric

/ symbol
`sym
/ <---- entity.name.type
`sym_sym
/ <---- entity.name.type
/    ^^^ variable
`sym/sym
/ <---- entity.name.type
/    ^^^ variable
`:sym
/ <----- entity.name.type
`:sym_sym
/ <----- entity.name.type
/     ^^^ variable
`:sym/sym
/ <--------- entity.name.type
`s:ym/sym
/ <--------- entity.name.type
`s/ym:sym
/ <-- entity.name.type
/  ^^ variable
/     ^^^variable

/ timestamp
1999.12.31D
/ <----------- constant.numeric
1999.12.31D23:59:59
/ <------------------- constant.numeric
1999.12.31D23:59:59.
/ <-------------------- constant.numeric
1999.12.31D23:59:59.123456789
/ <----------------------------- constant.numeric
0Np
/ <--- constant.numeric
0np
/ <--- constant.numeric
0Wp
/ <--- constant.numeric
-0Wp
/ <---- constant.numeric
0wp
/ <--- constant.numeric
-0wp
/ <---- constant.numeric

/ month
1999.12m
/ <-------- constant.numeric
0Nm
/ <--- constant.numeric
0nm
/ <--- constant.numeric
0Wm
/ <--- constant.numeric
-0Wm
/ <---- constant.numeric
0wm
/ <--- constant.numeric
-0wm
/ <---- constant.numeric

/ date
1999.12.31
/ <---------- constant.numeric
0Nd
/ <--- constant.numeric
0nd
/ <--- constant.numeric
0Wd
/ <--- constant.numeric
-0Wd
/ <---- constant.numeric
0wd
/ <--- constant.numeric
-0wd
/ <---- constant.numeric

/ datetime
1999.12.31T
/ <----------- constant.numeric
1999.12.31T23:59:59
/ <------------------- constant.numeric
1999.12.31T23:59:59.
/ <-------------------- constant.numeric
1999.12.31T23:59:59.123
/ <----------------------------- constant.numeric
0Nz
/ <--- constant.numeric
0nz
/ <--- constant.numeric
0Wz
/ <--- constant.numeric
-0Wz
/ <---- constant.numeric
0wz
/ <--- constant.numeric
-0wz
/ <---- constant.numeric

/ timespan
0123456789D
/ <----------- constant.numeric
0123456789D23:59:59
/ <------------------- constant.numeric
0123456789D23:59:59.
/ <-------------------- constant.numeric
0123456789D23:59:59.123456789
/ <----------------------------- constant.numeric
0Nn
/ <--- constant.numeric
0nn
/ <--- constant.numeric
0Wn
/ <--- constant.numeric
-0Wn
/ <---- constant.numeric
0wn
/ <--- constant.numeric
-0wn
/ <---- constant.numeric

/ minute
00:00
/ <----- constant.numeric
99:59
/ <------ constant.numeric
0Nu
/ <--- constant.numeric
0nu
/ <--- constant.numeric
0Wu
/ <--- constant.numeric
-0Wu
/ <---- constant.numeric
0wu
/ <--- constant.numeric
-0wu
/ <---- constant.numeric

/ second
00:00:00
/ <-------- constant.numeric
99:59:59
/ <--------- constant.numeric
0Nv
/ <--- constant.numeric
0nv
/ <--- constant.numeric
0Wv
/ <--- constant.numeric
-0Wv
/ <---- constant.numeric
0wv
/ <--- constant.numeric
-0wv
/ <---- constant.numeric

/ time
00:00:00.000
/ <------------ constant.numeric
99:59:59.999
/ <------------ constant.numeric
0Nt
/ <--- constant.numeric
0nt
/ <--- constant.numeric
0Wt
/ <--- constant.numeric
-0Wt
/ <---- constant.numeric
0wt
/ <--- constant.numeric
-0wt
/ <---- constant.numeric
