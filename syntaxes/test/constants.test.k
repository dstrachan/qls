/ SYNTAX TEST "source.k"

/ io
0:`test.csv
/ <-- constant.language.k
/ ^^^^^^^^^ entity.name.type.symbol.k
data:0:`test.csv
/ <---- variable.k
/    ^^ constant.language.k
/      ^^^^^^^^^ entity.name.type.symbol.k
`test.csv 0:0:`test.csv
/ <--------- entity.name.type.symbol.k
/         ^^ constant.language.k
/           ^^ constant.language.k
/             ^^^^^^^^^ entity.name.type.symbol.k
`test.csv 0:data:0:`test.csv
/ <--------- entity.name.type.symbol.k
/         ^^ constant.language.k
/           ^^^^ variable.k
/                ^^ constant.language.k
/                  ^^^^^^^^^ entity.name.type.symbol.k
00:`test.csv
/ <--- -constant.language.k
/  ^^^^^^^^^ entity.name.type.symbol.k

1:`test
/ <-- constant.language.k
/ ^^^^^ entity.name.type.symbol.k
data:1:`test
/ <---- variable.k
/    ^^ constant.language.k
/      ^^^^^ entity.name.type.symbol.k
`test 1:1:`test
/ <----- entity.name.type.symbol.k
/     ^^ constant.language.k
/       ^^ constant.language.k
/         ^^^^^ entity.name.type.symbol.k
`test 1:data:1:`test
/ <----- entity.name.type.symbol.k
/     ^^ constant.language.k
/       ^^^^ variable.k
/            ^^ constant.language.k
/              ^^^^^ entity.name.type.symbol.k
01:`test
/ <--- -constant.language.k
/  ^^^^^ entity.name.type.symbol.k

fun:`test 2:(`fun;1)
/ <--- variable.k
/   ^^^^^ entity.name.type.symbol.k
/         ^^ constant.language.k
/            ^^^^ entity.name.type.symbol.k
/                 ^ constant.numeric.k
02:(`fun;1)
/ <--- -constant.language.k
/   ^^^^ entity.name.type.symbol.k
/        ^ constant.numeric.k

/ boolean
0b
/ <-- constant.numeric.k
1b
/ <-- constant.numeric.k
00b
/ <--- constant.numeric.k
01b
/ <--- constant.numeric.k
10b
/ <--- constant.numeric.k
11b
/ <--- constant.numeric.k

/ guid
0Ng
/ <--- constant.numeric.k
0ng
/ <--- constant.numeric.k

/ byte
0x
/ <-- constant.numeric.k
0x0
/ <--- constant.numeric.k
0x00
/ <---- constant.numeric.k
0x0123456789abcdefABCDEF
/ <------------------------ constant.numeric.k

/ short
0123456789h
/ <----------- constant.numeric.k
0Nh
/ <--- constant.numeric.k
0nh
/ <--- constant.numeric.k
0Wh
/ <--- constant.numeric.k
-0Wh
/ <---- constant.numeric.k
0wh
/ <--- constant.numeric.k
-0wh
/ <---- constant.numeric.k

/ int
0123456789i
/ <----------- constant.numeric.k
0Ni
/ <--- constant.numeric.k
0ni
/ <--- constant.numeric.k
0Wi
/ <--- constant.numeric.k
-0Wi
/ <---- constant.numeric.k
0wi
/ <--- constant.numeric.k
-0wi
/ <---- constant.numeric.k

/ long
0123456789
/ <----------- constant.numeric.k
0123456789j
/ <----------- constant.numeric.k
0N
/ <------------ constant.numeric.k
0Nj
/ <--- constant.numeric.k
0nj
/ <--- constant.numeric.k
0W
/ <-- constant.numeric.k
-0W
/ <--- constant.numeric.k
0Wj
/ <--- constant.numeric.k
-0Wj
/ <---- constant.numeric.k
0wj
/ <--- constant.numeric.k
-0wj
/ <--- constant.numeric.k

/ real
0123456789e
/ <----------- constant.numeric.k
.0123456789e
/ <------------ constant.numeric.k
0123456789.e
/ <------------ constant.numeric.k
0123456789.0123456789e
/ <---------------------- constant.numeric.k
0123456789e0123456789e
/ <---------------------- constant.numeric.k
0123456789e+0123456789e
/ <----------------------- constant.numeric.k
0123456789e-0123456789e
/ <----------------------- constant.numeric.k
.0123456789e0123456789e
/ <----------------------- constant.numeric.k
.0123456789e+0123456789e
/ <------------------------ constant.numeric.k
.0123456789e-0123456789e
/ <------------------------ constant.numeric.k
0123456789.e0123456789e
/ <----------------------- constant.numeric.k
0123456789.e+0123456789e
/ <------------------------ constant.numeric.k
0123456789.e-0123456789e
/ <------------------------ constant.numeric.k
0123456789.0123456789e0123456789e
/ <--------------------------------- constant.numeric.k
0123456789.0123456789e+0123456789e
/ <---------------------------------- constant.numeric.k
0123456789.0123456789e-0123456789e
/ <---------------------------------- constant.numeric.k
0Ne
/ <--- constant.numeric.k
0ne
/ <--- constant.numeric.k
0We
/ <--- constant.numeric.k
-0We
/ <---- constant.numeric.k
0we
/ <--- constant.numeric.k
-0we
/ <---- constant.numeric.k

/ float
0123456789f
/ <----------- constant.numeric.k
.0123456789
/ <----------- constant.numeric.k
.0123456789f
/ <------------ constant.numeric.k
0123456789.
/ <----------- constant.numeric.k
0123456789.f
/ <------------ constant.numeric.k
0123456789.0123456789
/ <--------------------- constant.numeric.k
0123456789.0123456789f
/ <---------------------- constant.numeric.k
0123456789e0123456789
/ <--------------------- constant.numeric.k
0123456789e+0123456789
/ <---------------------- constant.numeric.k
0123456789e-0123456789
/ <---------------------- constant.numeric.k
0123456789e0123456789f
/ <---------------------- constant.numeric.k
0123456789e+0123456789f
/ <----------------------- constant.numeric.k
0123456789e-0123456789f
/ <----------------------- constant.numeric.k
.0123456789e0123456789
/ <---------------------- constant.numeric.k
.0123456789e+0123456789
/ <----------------------- constant.numeric.k
.0123456789e-0123456789
/ <----------------------- constant.numeric.k
.0123456789e0123456789f
/ <----------------------- constant.numeric.k
.0123456789e+0123456789f
/ <------------------------ constant.numeric.k
.0123456789e-0123456789f
/ <------------------------ constant.numeric.k
0123456789.e0123456789
/ <---------------------- constant.numeric.k
0123456789.e+0123456789
/ <----------------------- constant.numeric.k
0123456789.e-0123456789
/ <----------------------- constant.numeric.k
0123456789.e0123456789f
/ <----------------------- constant.numeric.k
0123456789.e+0123456789f
/ <------------------------ constant.numeric.k
0123456789.e-0123456789f
/ <------------------------ constant.numeric.k
0123456789.0123456789e0123456789
/ <-------------------------------- constant.numeric.k
0123456789.0123456789e+0123456789
/ <--------------------------------- constant.numeric.k
0123456789.0123456789e-0123456789
/ <--------------------------------- constant.numeric.k
0123456789.0123456789e0123456789f
/ <--------------------------------- constant.numeric.k
0123456789.0123456789e+0123456789f
/ <---------------------------------- constant.numeric.k
0123456789.0123456789e-0123456789f
/ <---------------------------------- constant.numeric.k
0Nf
/ <--- constant.numeric.k
0n
/ <-- constant.numeric.k
0nf
/ <--- constant.numeric.k
0Wf
/ <--- constant.numeric.k
-0Wf
/ <---- constant.numeric.k
0w
/ <-- constant.numeric.k
-0w
/ <--- constant.numeric.k
0wf
/ <--- constant.numeric.k
-0wf
/ <---- constant.numeric.k

/ char
"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
/ <------------------------------------------------------ string.quoted.double.k
0123456789c
/ <-- constant.numeric.k
-0123456789c
/ <-- constant.numeric.k
0Nc
/ <--- constant.numeric.k
0nc
/ <--- constant.numeric.k
0Wc
/ <--- constant.numeric.k
-0Wc
/ <---- constant.numeric.k
0wc
/ <--- constant.numeric.k
-0wc
/ <---- constant.numeric.k

/ symbol
`sym
/ <---- entity.name.type.symbol.k
`sym_sym
/ <---- entity.name.type.symbol.k
/    ^^^ variable.k
`sym/sym
/ <---- entity.name.type.symbol.k
/    ^^^ variable.k
`:sym
/ <----- entity.name.type.symbol.handle.k
`:sym_sym
/ <----- entity.name.type.symbol.handle.k
/     ^^^ variable.k
`:sym/sym
/ <--------- entity.name.type.symbol.handle.k
`s:ym/sym
/ <--------- entity.name.type.symbol.k
`s/ym:sym
/ <-- entity.name.type.symbol.k
/  ^^ variable.k
/     ^^^variable.k

/ timestamp
1999.12.31D
/ <----------- constant.numeric.k
1999.12.31D23:59:59
/ <------------------- constant.numeric.k
1999.12.31D23:59:59.
/ <-------------------- constant.numeric.k
1999.12.31D23:59:59.123456789
/ <----------------------------- constant.numeric.k
0Np
/ <--- constant.numeric.k
0np
/ <--- constant.numeric.k
0Wp
/ <--- constant.numeric.k
-0Wp
/ <---- constant.numeric.k
0wp
/ <--- constant.numeric.k
-0wp
/ <---- constant.numeric.k

/ month
1999.12m
/ <-------- constant.numeric.k
0Nm
/ <--- constant.numeric.k
0nm
/ <--- constant.numeric.k
0Wm
/ <--- constant.numeric.k
-0Wm
/ <---- constant.numeric.k
0wm
/ <--- constant.numeric.k
-0wm
/ <---- constant.numeric.k

/ date
1999.12.31
/ <---------- constant.numeric.k
0Nd
/ <--- constant.numeric.k
0nd
/ <--- constant.numeric.k
0Wd
/ <--- constant.numeric.k
-0Wd
/ <---- constant.numeric.k
0wd
/ <--- constant.numeric.k
-0wd
/ <---- constant.numeric.k

/ datetime
1999.12.31T
/ <----------- constant.numeric.k
1999.12.31T23:59:59
/ <------------------- constant.numeric.k
1999.12.31T23:59:59.
/ <-------------------- constant.numeric.k
1999.12.31T23:59:59.123
/ <----------------------------- constant.numeric.k
0Nz
/ <--- constant.numeric.k
0nz
/ <--- constant.numeric.k
0Wz
/ <--- constant.numeric.k
-0Wz
/ <---- constant.numeric.k
0wz
/ <--- constant.numeric.k
-0wz
/ <---- constant.numeric.k

/ timespan
0123456789D
/ <----------- constant.numeric.k
0123456789D23:59:59
/ <------------------- constant.numeric.k
0123456789D23:59:59.
/ <-------------------- constant.numeric.k
0123456789D23:59:59.123456789
/ <----------------------------- constant.numeric.k
0Nn
/ <--- constant.numeric.k
0nn
/ <--- constant.numeric.k
0Wn
/ <--- constant.numeric.k
-0Wn
/ <---- constant.numeric.k
0wn
/ <--- constant.numeric.k
-0wn
/ <---- constant.numeric.k

/ minute
00:00
/ <----- constant.numeric.k
99:59
/ <------ constant.numeric.k
0Nu
/ <--- constant.numeric.k
0nu
/ <--- constant.numeric.k
0Wu
/ <--- constant.numeric.k
-0Wu
/ <---- constant.numeric.k
0wu
/ <--- constant.numeric.k
-0wu
/ <---- constant.numeric.k

/ second
00:00:00
/ <-------- constant.numeric.k
99:59:59
/ <--------- constant.numeric.k
0Nv
/ <--- constant.numeric.k
0nv
/ <--- constant.numeric.k
0Wv
/ <--- constant.numeric.k
-0Wv
/ <---- constant.numeric.k
0wv
/ <--- constant.numeric.k
-0wv
/ <---- constant.numeric.k

/ time
00:00:00.000
/ <------------ constant.numeric.k
99:59:59.999
/ <------------ constant.numeric.k
0Nt
/ <--- constant.numeric.k
0nt
/ <--- constant.numeric.k
0Wt
/ <--- constant.numeric.k
-0Wt
/ <---- constant.numeric.k
0wt
/ <--- constant.numeric.k
-0wt
/ <---- constant.numeric.k
