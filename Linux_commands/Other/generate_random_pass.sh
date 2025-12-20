# https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string#230676
tr -dc A-Za-z0-9 </dev/urandom | head -c 64; echo
tr -dc 'A-Za-z0-9"#$%&()*+,-./:;<=>?@[\]^_~' </dev/urandom | head -c 20; echo
