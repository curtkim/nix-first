let
  mul = s: s.a * s.b;                 # implicit
  mul2 = {a, b}: a*b;                 # explicit
  mul3 = {a, b ? 3}: a*b;             # default 
  mul4 = {a, b, ...}: a*b;            # variadic
  mul5 = s@{a, b, ...}: a*b*s.c;      # @-pattern
in
  {
    mul_val = mul {a=2; b=3; c=4;}; 
    mul2_val = mul2 {a=2; b=3;};      # c=4;를 추가하면 에러가 발생한다.
    mul3_val = mul3 {a=2;};
    mul4_val = mul4 {a=2; b=3; c=4;};
    mul5_val = mul5 {a=2; b=3; c=4;};
  }
