var =: 1&$
varu =: 32&~:@(3!:0) *. 1&=@# *. 0&~:@#@$
walk =: 4 : 0
  if. (varu x) *. ((<x) e.{."1 (0&{::"0) y)
    do. y walk~;((<x)i.~{."1 (0&{::"0) y){(}."1 (0&{::"0) y)
  else. x
  end.
)
ext_s =: 2 : '(<u;v),]'
unit =: mzero,~<
pairu =: 32&=@(3!:0) *. 0&<@#
unify =: 2 : 0
  a =. u walk y
  b =. v walk y
  if. (#u)=(#v) NB. unequal length => fails
  do.
   if. (a -: b) *. (varu a) *. varu b
    do. y
   elseif. varu a
    do. a ext_s b y
   elseif. varu b
    do. b ext_s a y
   elseif. (pairu a) *. pairu b
    do. (}.a) unify (}.b) (0&{::a) unify (0&{::b) y
   else. y
   end.
  else. 0
  end.
)
call =: 3 : 'var 1&{::y'
fresh =: 3 : '({.y),>:&.>}.y'
callfresh =: 3 : '(call ; fresh) y'
equivalent =: 2 : 0
 s =: (0&{:: u y) unify v (1&{::u y)
  if. s -: ''
    do. mzero
  else. unit s;}.fresh y
  end.
)
mplus =: 2 : 0 NB. only works for lists, not cons cells
 if. ((2&=@(3!:0)@((0;0)&{::) *. 32&=@(3!:0)) :: 0)u`''
  do. (v mplus (u ''))"_
 elseif. ''-:u
  do. v
 else. ({.u),(}.u) mplus v
 end.
)
disj =: 2 : 0
 (u y) mplus (v y)
)
bind =: 2 : 0
 if. ((2&=@(3!:0)@((0;0)&{::) *. 32&=@(3!:0)) :: 0)u`''
  do. ((u'') bind v)"_
 elseif. ''-:u NB.
  do. mzero
 else. (v 0&{::u) mplus ((}.u) bind v)
 end.
)
conj =: 2 : 0
 (u y) bind v
)