var =: 1&$
varu =: 1&=@# *. 0&~:@#@$
varequ =: ([-:])*.(varu@[*.varu@])
NB.walk only tests for key existence, not val
NB.inefficient, linked list and traversed twice
walk =: (((>:@(0&{::@]i.{.@[){::])`((>:@(0&{::@]i.{.@[){::])$:])@.(varu@(>:@(0&{::@]i.{.@[){::]))) :: [)
ext_s =: 2 : '((u;v);])'
unit =: mzero;~]
pairu =: ''-.@-:}.

NB. CONTINUE@ '({.@(u&walk)@] unify {.@(v&walk)@])'
NB. CAUTION: Infinite loop!!
unify =: 2 : ']`((u&walk)@] ext_s (v&walk)@])`((v&walk)@] ext_s (u&walk)@])`({.@(u&walk)@] unify {.@(v&walk)@])`]@.(1 i.~((u&walk -: v&walk)*.(varu@(u&walk)*.varu@(v&walk)))`(varu@(u&walk))`(varu@(v&walk))`(pairu@(u&walk)*.pairu@(v&walk))`:0)'

NB.(1$2) unify (1$2) (2 1 3;(1$1);4;(1$4))
NB.(1$3) unify (1$3) (2 1 3;(1$1);4;(1$4))
NB.(1$3) unify (1$1) (2 1 3;(1$1);4;(1$4))
NB.(1$1) unify (1$3) (2 1 3;(1$1);4;(1$4))
NB.(1$2) unify (1$3) (2 1 3;(2 1);4;(5 4))