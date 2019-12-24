var =: 1&$
varu =: 1&=@# *. 0&~:@#@$
varequ =: ([-:])*.(varu@[*.varu@])
walk =: 4 : 0
  if. (1$<'')-: {.y  NB. CAUTION: subtle shape issue
    do. 'ERROR: attempted to walk the empty state.'
  elseif. (varu x) *. ({:$y)>({.y)i.(<x)
    do. y walk~ 1{::y{"1~({.y)i.(<x)
  else. x
  end.
)
ext_s =: 2 : '(u,.@;v),"1]'
unit =: mzero,~< NB. potentially wrong dimension
pairu =: (1&<)@#*.(32&=)@(3!:0)
unify =: 2 : 0
  a =. u walk y
  b =. v walk y
  c =. 'ERROR: attempted to walk the empty state.'
  if. (b -: c) +. a -: c
    do. c
  elseif. (a varequ b) *. (varu a) *. varu b
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

callfresh =: 1 : 0
  (u (var 1&{::y)) ({.y),>:&.>}.y
)

equivalent =: 2 : 0
  s =. u unify v 0&{::y
  if. s -: 'ERROR: attempted to walk the empty state.'
    do. 'ERROR: attempted to walk the empty state.'
  elseif. s -: ''
    do. mzero
  else. unit s,.@;}.y
  end.
)

NB.CONTINUE HERE
empty_state (5 equivalent)callfresh
5 equivalent (1$0) '',.@;1
5 unify (1$0) <''
(1$0) ext_s 5 <''
5 walk '',.@;1
(1$0) walk '',.@;1