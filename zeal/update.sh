#!/usr/bin/env bash

set -eu

cd .docsets

BASE_LIST=(Bash C++ Elixir "Emacs Lisp" Erlang Haskell "Python 2" "Python 3" "Django" Rust)

LIST=( $BASE_LIST )

for i in $LIST; do
    echo "LIST>" $i "<"
done

rm -rf *.docset || true

for n in $LIST; do
    nn=${n// /_}
    if [ -d "${n}.docset" -o -d "${nn}.docset" ]; then
        continue
    fi
    echo $n
    curl http://sanfrancisco.kapeli.com/feeds/${nn}.tgz -o ${nn}.tgz
    tar xfz ${nn}.tgz
    rm ${nn}.tgz
done
