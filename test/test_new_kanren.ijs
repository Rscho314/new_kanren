load jpath '~Projects/new_kanren/release/kanren.ijs'


test_var =: 3 :0
  assert. (1$0) -: (var 0)
  assert. (1$1) -: (var 1)
  assert. (1$10) -: (var 10)
)

test_varu =: 3 :0
  assert. varu 1$0
  assert. varu 1$1
  assert. varu 1$10
)

test_varequ =: 3 :0
  assert. (1$1) varequ (1$1)
  assert. -.(1$1) varequ (1$0)
  assert. -.1 varequ 1
)

test_walk =: 3 :0
  assert. 4&=(1$1) walk (2 1;(1$1);4)
  assert. 4&=(1$2) walk (2 1;(1$1);4)
  assert. (1$3) -: (1$3) walk (2 1;(1$1);4)
  assert. (4 5) -: (1$2) walk (2 1 3 4;(1$1);(4 5);(6 7);(3 4))
)