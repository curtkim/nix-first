## reference
- https://www.codyhiar.com/blog/replace-pyenv-with-a-nix-flake/
- https://github.com/NixOS/nixpkgs/issues/230214

## howto

    nix develop .#python39 -c $SHELL
    virtualenv .venv && source .venv/bin/activate
    pip install torch 

    /sbin/ldconfig -p | grep stdc++
    
      libstdc++.so.6 (libc6,x86-64) => /lib/x86_64-linux-gnu/libstdc++.so.6

    LD_LIBRARY_PATH=/lib/x86_64-linux-gnu python -c "import torch; print(torch.cuda.is_available());"



