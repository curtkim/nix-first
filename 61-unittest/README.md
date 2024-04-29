## reference
https://www.tweag.io/blog/2022-09-01-unit-test-your-nix-code/
https://github.com/nix-community/nixt

## howto

    nix eval --impure --expr 'import ./test.nix {}'
    nix run github:nix-community/nixt -- test.nixt
