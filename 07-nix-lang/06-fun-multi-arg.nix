let 
  mul = a: (b: a*b);
  mul2 = a: b: a*b;
in 
  {mul_val = mul 2 3; mul2_val = mul2 2 3;}
