var =: 1&$
varu =: 1&=@# *. 0&~:@#@$
varequ =: ([-:])*.(varu@[*.varu@])
walk =: 4 : 'x`((((({.y) i. (<x)) {:: (}.y)) walk y) :: x)@.(varu x)'
walk =: 4 : '(y{::~1,~({.y) i. (<x)) :: x y'
walk =: [`((]walk~]{::~1,~{.@] i. <@[) :: [)@.(varu@[)
ext_s =: 2 : '((u;v);])'
unit =: mzero;~]
pairu =: (1&<)@#*.(32&=)@(3!:0)

NB. 'unify' had to be made explicit because implicit recursion leads to infinite loop
NB.(unify (vector 1) (vector 2) `( (,(vector 1)  (3 ,(vector 5))) (,(vector 2)(,(vector 6) 7))))
NB.((#(5) . 7) (#(6) . 3) (#(1) (3 #(5))) (#(2) (#(6) 7)))

unify =: 2 : 0
  select. 1 i.~((u&walk -: v&walk)*.(varu@(u&walk)*.varu@(v&walk)))`(varu@(u&walk))`(varu@(v&walk))`(pairu@(u&walk)*.pairu@(v&walk))`:0 y
    case. 0 do. y
    case. 1 do. (u walk y) ext_s (v walk y) y
    case. 2 do. (v walk y) ext_s (u walk y) y
    NB. '1&{::' relies on assumption that we have only dotted pairs (not proper lists)!
    case. 3 do. (1&{:: u walk y) unify (1&{:: v walk y) (0&{:: u walk y) unify (0&{:: v walk y) y
    case. 4 do. y
    case.   do. 'error'
  end.
)

NB. Adverb train for 'equivalent'