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
)

test_unify =: 3 : 0
  NB.(unify (vector 1) (vector 2) `( (,(vector 1) . 4) (,(vector 2) . ,(vector 1)) )) => ((#(1) . 4) (#(2) . #(1)))
  assert. (2 2$(1$2);(1$1);(1$1);4) -: (1$1) unify (1$2) (2 2$(1$2);(1$1);(1$1);4)
  NB.WRONG: should yield 'nil'
  assert. (((1$3);2);1 2;(1$3);(1$4)) -: (1$1) unify 2 (2 2$(1$2);(1$1);(1$1);4)
  assert. (((1$4);1);1 2;(1$3);(1$4)) -: 1 unify (1$2) 1 2;(1$3);(1$4)
  assert. (((1$6);3);1 2;(3;(1$5));<((1$6);7)) -: (1$1) unify (1$2) 1 2;(3;(1$5));<((1$6); 7)
  assert. (1 2;3;4) -: (1$1) unify (1$2) 1 2;3;4
)