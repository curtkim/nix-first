## reference
https://www.tweag.io/blog/2022-09-01-unit-test-your-nix-code/

## howto

    nix eval --impure --expr 'import ./test.nix {}'
    nix run github:nix-community/nixt -- test.nixt
