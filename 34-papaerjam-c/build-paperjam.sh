declare -xp

tar -xf "$SOURCE"
cd paperjam-1.2
make install PREFIX="$out"
