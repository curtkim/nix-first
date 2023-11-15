{
  a = 1 +2;
  b = let
      x = 1;
      y = 2;
      in x+y;
  # comments are supported
  inherit_value = let
                  x = 1;
                  y = 2;
                  in {
                    inherit x y;
                  };
                  # x = x; y = y; is equivalent to
  inherit_value2 = let
                   a = {x=1; y=2;};
                   in {
                     inherit (a) x y;
                   };
  string_interpolation = let
                         name = "Nix";
                         in
                         "hello ${name}";
  mydir = ./relative;
  my_nixpkgs_angle_bracket_syntax = <nixpkgs>;
  my_function = x: x+1;
  my_function_call = let 
                     f = x: x+1;
                     in f 1;
}
