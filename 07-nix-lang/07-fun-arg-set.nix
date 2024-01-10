let
  mul = s: s.a * s.b;
  mul2 = {a, b}: a*b;
in
  {
    mul_val = mul {a=2; b=3; c=4;}; 
    mul2_val = mul2 {a=2; b=3;};     # c=4;를 추가하면 에러가 발생한다.
  }
