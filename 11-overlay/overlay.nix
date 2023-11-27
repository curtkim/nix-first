self: super: {
  dhall = builtins.fetchTarball
    "https://github.com/dhall-lang/dhall-haskell/releases/download/1.30.0/dhall-1.30.0-x86_64-linux.tar.bz2"; 
}
