var =: 1&$
varu =: 1&=@# *. 0&~:@#@$
walk =: 4 : 0
  if. (<'')-: {.y
    do. 'ERROR: attempted to walk the empty state.'
  elseif. (varu x) *. ({:$y)>({.y)i.(<x)
    do. y walk~ 1{::y{"1~({.y)i.(<x)
  else. x
  end.
)
ext_s =: 2 : '(u,.@;v),"1]'
unit =: mzero,~<
pairu =: (1&<)@#*.(32&=)@(3!:0)
unify =: 2 : 0
  a =. u walk y
  b =. v walk y
  c =. 'ERROR: attempted to walk the empty state.'
  if. (b -: c) +. a -: c
    do. c
  elseif. (a -: b) *. (varu a) *. varu b
    do. y
  elseif. varu a
    do. a ext_s b y
  elseif. varu b
    do. b ext_s a y
  elseif. (pairu a) *. pairu b
    do. (1&{:: a) unify (1&{:: b) (0&{:: a) unify (0&{:: b) y
  else. y
  end.
)
call =: 3 : 'var 1&{::y'
fresh =: 3 : '({.y),>:&.>}.y'
callfresh =: 3 : '(call ; fresh) y'
equivalent =: 2 : 0
 s =: (0&{:: u y) unify v (1&{::u y)
 if. s -: 'ERROR: attempted to walk the empty state.'
    do. 'ERROR: attempted to walk the empty state.'
  elseif. s -: ''
    do. mzero
  else. unit s;}.fresh y
  end.
)

mplus =: 2 : 0
 if. ((2&=@(3!:0)@((0;0)&{::) *. 32&=@(3!:0)) :: 0)u`''
  do. (v mplus (u ''))"_
 elseif. ''-:u NB. possibly wrong, could be mzero
  do. v
 else. (0&{::u);(}.u) mplus v
 end.
)

bind =: 2 : 0
 if. ((2&=@(3!:0)@((0;0)&{::) *. 32&=@(3!:0)) :: 0)u`''
  do. ((u'') bind v)"_
 elseif. ''-:u NB. possibly wrong, could be mzero
  do. mzero
 else. (v 0&{::u) mplus ((}.u) bind v)
 end.
)
NB. ((call/fresh (lambda (b) (disj (== b 5) (== b 6)))) empty-state)
disj =: 2 : 0
 (u y) mplus (v y)
)
callfresh (1 : '(u equivalent 5) disj (u equivalent 6)') empty_state

conj =: 2 : 0
 (u y) bind v
)
