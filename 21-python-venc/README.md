## reference

https://github.com/NixOS/nixpkgs/blob/49829a9adedc4d2c1581cc9a4294ecdbff32d993/doc/languages-frameworks/python.section.md#how-to-consume-python-modules-using-pip-in-a-virtual-environment-like-i-am-used-to-on-other-operating-systems-how-to-consume-python-modules-using-pip-in-a-virtual-environment-like-i-am-used-to-on-other-operating-systems

## howto

    NIXPKGS_ALLOW_UNFREE=1 nix-shell

## note
-  make .venv/lib64/python3.11/site-packages/flask

## buildInputs / pythonPackages.requests  
    $ echo $PYTHONPATH | tr ':' '\n'
    /nix/store/qxsnv4322wqi9w629b572k898viw756h-python3.11-cffi-1.16.0/lib/python3.11/site-packages
    /nix/store/r0mzj4k7gzx3bp4mbnr69x6if6lxxsb1-python3.11-pycparser-2.21/lib/python3.11/site-packages
    /nix/store/qp5zys77biz7imbk6yy85q5pdv7qk84j-python3-3.11.6/lib/python3.11/site-packages
    /nix/store/hpr19vaw5alwnmnd8nyf6r50n4hwwj1a-python3.11-numpy-1.26.1/lib/python3.11/site-packages
    /nix/store/71js2p8zx17fqgq2m1b5f7q92ig0v7nn-python3.11-requests-2.31.0/lib/python3.11/site-packages
    /nix/store/6jj18jqyik8k06plad2hm9fwcrnhpxf3-python3.11-brotlicffi-1.1.0.0/lib/python3.11/site-packages
    /nix/store/hk5xz5kyhr1vaq2p65990c2fxw7mxlmp-python3.11-certifi-2023.07.22/lib/python3.11/site-packages
    /nix/store/g3kzbrnirxky2w4g3n67p01745pa8xcc-python3.11-charset-normalizer-3.2.0/lib/python3.11/site-packages
    /nix/store/g3w192qs0avwjaw776yiyaq5l0dcbwdp-python3.11-idna-3.4/lib/python3.11/site-packages
    /nix/store/71236y06cag3yb637q5jj358ci6f20ah-python3.11-urllib3-2.0.7/lib/python3.11/site-packages

