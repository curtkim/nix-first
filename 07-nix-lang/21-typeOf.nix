{
  a = builtins.typeOf "foo";
  b = builtins.typeOf (2+2);
  c = builtins.isInt(4);
  d = builtins.div 10 5;
}
