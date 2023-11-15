{
  a = (import ./00_expr.nix).a;
  b = (import ./00_expr.nix).my_function 2;
}
