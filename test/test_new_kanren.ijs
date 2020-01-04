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
  assert. -.varu (<1$10)
)

test_walk =: 3 : 0
 assert. (6 7)-:(1$2) walk (<(1$3);(4 5)),(<(1$2);(6 7))
 assert. (4 5)-:(1$2) walk (<(1$3);(4 5)),(<(1$2);(1$3))
 assert. ''-:'' walk (<(1$3);(4 5)),(<(1$2);(1$3))
 assert. ''-:'' walk (<'')
 assert. ''-:'' walk mzero
)

test_unify =: 3 : 0
assert. ((<(1$0);3),'')-:(;/1 2 3) unify (1;2;(1$0)) ''
assert. ((<(1$0);3),'')-:(1;2;(1$0)) unify (;/1 2 3) ''
assert. ((<(1$0);3),'')-:(1;2;3;'') unify (1;2;(1$0);'') ''
assert. ((<(1$0);3),'')-:(1;2;(1$0);'') unify (1;2;3;'') ''
assert. ((<(1$1);3),(<(1$0);1),'')-:((1$0);2;(1$1)) unify (;/1 2 3) ''
assert. ((<(1$1);3),(<(1$0);1),'')-:(1;2;3;'') unify ((1$0);2;(1$1);'') ''
assert. ((<(1$1);3),(<(1$2);2),(<(1$0);1),'')-:(1;(1$2);3;'') unify ((1$0);2;(1$1);'') ''
assert. 0 = (;/1 2 3 4) unify (1;(1$0);4) ''
)

test_mplus =: 3 : 0
 assert. mzero -: ('') mplus ('')
)

test_disj =: 3 : 0
 assert. ((<((<(1$0);6),'');1),(<((<(1$0);5),'');1))-: callfresh (1 : '(u equivalent 6) disj (u equivalent 5)') empty_state
)

test_bind =: 3 : 0
 ''
)

test_conj =: 3 : 0
assert. ((<(((<(1$1);5),''),((<(1$0);5),''),'');2),'') -: callfresh (1 : '(u equivalent 5) conj (u equivalent 5)') empty_state
)

test_second_set_t1 =: 3 : 0
 assert. (((<(1$0);5),'');1) -: 0&{::callfresh equivalent 5 empty_state
)

test_second_set_t2 =: 3 : 0
 assert. '' -: }. callfresh equivalent 5 empty_state
)

test_second_set_t3 =: 3 : 0
 assert. (((((<(1$1);5),''),((<(1$0);7),''),'');2),'') -: 0&{::(callfresh equivalent 7) conj (callfresh (1 : '(u equivalent 5) disj (u equivalent 6)')) empty_state
)

test_second_set_t3_take =: 3 : 0
 assert. ((<(((<(1$1);5),''),((<(1$0);7),''),'');2),'') -: 1&{.(callfresh equivalent 7) conj (callfresh (1 : '(u equivalent 5) disj (u equivalent 6)')) empty_state
)

test_second_set_t4 =: 3 : 0
 assert. (((((<(1$1);6),''),((<(1$0);7),''),'');2),'') -: 0&{::}.(callfresh equivalent 7) conj (callfresh (1 : '(u equivalent 5) disj (u equivalent 6)')) empty_state
)

test_second_set_t5 =: 3 : 0
 assert. '' -: }.^:2 (callfresh equivalent 7) conj (callfresh (1 : '(u equivalent 5) disj (u equivalent 6)')) empty_state
)