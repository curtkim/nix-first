## howto

    nix eval --file 00_expr.nix
    nix eval --expr 'builtins.toString'

## Derivation
- The Nix language is used to describe derivations.
- Nix run derivations to produce build results.
- Build results can in turn be used as input for other derivations.


