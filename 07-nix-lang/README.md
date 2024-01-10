## howto

    nix eval --file 00_expr.nix
    nix eval --expr 'builtins.toString'
    nix eval --expr 'builtins.toString 123'
    nix eval --expr 'builtins.attrNames {a=1; b=2;}'
    nix eval --expr '{a=1; b=2;}' --apply builtins.attrNames

    nix eval --write-to ./out --expr '{foo = "bar"; subdir.bla = "123"}'


## Derivation
- The Nix language is used to describe derivations.
- Nix run derivations to produce build results.
- Build results can in turn be used as input for other derivations.


