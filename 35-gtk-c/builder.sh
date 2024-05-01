export PATH="$coreutils/bin:$gcc/bin:$pkgconfig/bin"
declare -xp
mkdir $out
gcc $(pkg-config --cflags gtk4) -o $out/hello-world-gtk $src $(pkg-config --libs gtk4)
