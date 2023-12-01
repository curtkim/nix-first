let
  result = builtins.trace "Debugging message" (1 + 2);
in
  result
