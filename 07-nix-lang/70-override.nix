let
  pkgs = import <nixpkgs> {};
  f = { a, b }: { result = a+b; };
  f2 = pkgs.lib.makeOverridable f { a = 1; b = 2; };
in
  {
    a = (f2.override {a = 4;}).result;
    b = (f2.override (prev : {a = prev.a+1;})).result;
  }
