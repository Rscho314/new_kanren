NB. Maybe bug: confusion btw '' & <'' as nil equivalent
var =: 1&$
varu =: 1&=@# *. 0&~:@#@$
varequ =: ([-:])*.(varu@[*.varu@])
NB. should test for '' in walk?
walk =: ([`(((>:@(0&{::@]i.{.@[){::])walk]) :: [)@.(varu@[))
ext_s =: 2 : '((u;v);])'
unit =: mzero;~]
pairu =: ''-.@-:}.

NB. 'unify' had to be made explicit because implicit recursion leads to infinite loop
NB.>@{. works for both number literals and boxed vectors (should change for '0&{::' ?)
unify =: 2 : 0
 select. 1 i.~((u&walk -: v&walk)*.(varu@(u&walk)*.varu@(v&walk)))`(varu@(u&walk))`(varu@(v&walk))`(pairu@(u&walk)*.pairu@(v&walk))`:0 y
  case. 0 do. y
  case. 1 do. (u walk y) ext_s (v walk y) y
  case. 2 do. (v walk y) ext_s (u walk y) y
  case. 3 do. (}. u walk y) unify (}. u walk y) ((>@{. u walk y) unify (>@{. u walk y) y)
  case. 4 do. y
  case.   do. 'error'
 end.
)

equivalent =: 2 : 'mzero"_`(unit }.@];~u unify v 0&{::)@.(''''-:u unify v 0&{::)'

callfresh =: 1 : '(u var@}.@])(];(>:&.>]))'

(1 : 'equivalent 5') callfresh