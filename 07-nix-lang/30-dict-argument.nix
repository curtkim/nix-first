let
  mkGreeting = { name }: {
    greeting = "Hello ${name}";
  };
in
  mkGreeting { name = "world"; }
