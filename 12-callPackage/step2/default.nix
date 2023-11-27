let pkgs = import <nixpkgs> {}; in
{
  hello = pkgs.callPackage ./hello.nix {};
  people = pkgs.callPackage ./hello.nix {audience = "people";};
}
