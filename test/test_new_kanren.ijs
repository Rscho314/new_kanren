load jpath '~Projects/new_kanren/release/kanren.ijs'


test_var =: 3 : 0
  assert. (1$0) -: (var 0)
  assert. (1$1) -: (var 1)
  assert. (1$10) -: (var 10)
)

test_varu =: 3 : 0
  assert. varu 1$0
  assert. varu 1$1
  assert. varu 1$10
)

test_varequ =: 3 : 0
  assert. (1$1) varequ (1$1)
  assert. -.(1$1) varequ (1$0)
  assert. -.1 varequ 1
)

test_walk =: 3 : 0
  NB.(walk (vector 1) `( (,(vector 1) . 4) (,(vector 2) . ,(vector 1)) )) => 4
  assert. 4&= (1$1) walk (2 2$(1$2);(1$1);(1$1);4)
  NB.(walk (vector 2) `( (,(vector 1) . 4) (,(vector 2) . ,(vector 1)) )) => 4
  assert. 4&= (1$2) walk (2 2$(1$2);(1$1);(1$1);4)
  NB.(walk (vector 3) `( (,(vector 1) . 4) (,(vector 2) . ,(vector 1)) )) => #(3)
  assert. (1$3) -: (1$3) walk (2 2$(1$2);(1$1);(1$1);4)
  NB.(walk 2 `( (,(vector 1) . 4) (,(vector 2) . ,(vector 1)) )) => 2
  assert. 2 -: 2 walk (2 2$(1$2);(1$1);(1$1);4)
  NB. infinite cycle case
  assert. 'error' -: (1$1) (walk :: 'error') (2 3$(1$1);4;(1$2);(1$1);(1$3);5)
  NB. walking the empty state case
  assert. 'ERROR: attempted to walk the empty state.' -: (1$1) walk empty_state
)

test_unify =: 3 : 0
  NB.OK (unify (vector 1) (vector 2) `( (,(vector 2) . ,(vector 1)) (,(vector 3) . ,(vector 1)) (,(vector 1) . ,(vector 4)) )) => ((#(2) . #(1)) (#(3) . #(1)) (#(1) . #(4)))
  assert. (2 3$ (1$2);(1$3);(1$1);(1$1);(1$1);(1$4)) -: (1$2) unify (1$3) (2 3$ (1$2);(1$3);(1$1);(1$1);(1$1);(1$4))
  NB.OK (unify (vector 1) 10 `( (,(vector 2) . ,(vector 1)) (,(vector 3) . ,(vector 1)) (,(vector 1) . ,(vector 4)) )) => ((#(4) . 10) (#(2) . #(1)) (#(3) . #(1)) (#(1) . #(4)))
  assert. (((1$4),.@;10),"1 (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);(1$4))) -: (1$1) unify 10 (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);(1$4))
  NB.(unify 10 (vector 1) `( (,(vector 2) . ,(vector 1)) (,(vector 3) . ,(vector 1)) (,(vector 1) . ,(vector 4)) )) => ((#(4) . 10) (#(2) . #(1)) (#(3) . #(1)) (#(1) . #(4)))
  assert. (((1$4),.@;10),"1 (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);(1$4))) -: 10 unify (1$1) (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);(1$4))
  NB.OK (unify `(,(vector 1) . ,(vector 2)) `(,(vector 3) . ,(vector 4)) `( (,(vector 2) . ,(vector 3)) (,(vector 1) . ,(vector 3)) (,(vector 3) . ,(vector 4)) )) => ((#(2) . #(3)) (#(1) . #(3)) (#(3) . #(4)))
  assert. (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);(1$4)) -: ((1$1);(1$2)) unify ((1$3);(1$4)) (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);(1$4))
  NB.OK (unify (vector 1) (vector 2) `( (,(vector 2) . ,(vector 3)) (,(vector 1) . ,(vector 3)) (,(vector 3) . 4) )) => ((#(2) . #(3)) (#(1) . #(3)) (#(3) . 4))
  assert. (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);4) -: (1$1) unify (1$2) (2 3$(1$2);(1$1);(1$3);(1$3);(1$3);4)
  NB.OK (unify (vector 1) (vector 2) `( (,(vector 1) . 4) (,(vector 2) . ,(vector 1)) )) => ((#(1) . 4) (#(2) . #(1)))
  assert. 'ERROR: attempted to walk the empty state.' -: (1$1) unify (1$2) empty_state
)

test_second_set_t1 =: 3 : 0
  empty_state (5 equivalent)callfresh
)