#!/usr/bin/bash

input_script="./generador.py"
ff="ff-metric"

problem_file="$(mktemp)"
tmp1="$(mktemp)"

echo "debug files:"
echo " * problem -> $problem_file"
echo " * output  -> $tmp1"


cd "$1" || {
    echo "$1 - folder not found"
    exit 1
}

cd -

if [ $# -eq 1 ]; then
    echo Please input problem data
    python3 "$1/$input_script" | tee "$problem_file"
elif [ $# -eq 2 ]; then
    python3 "$1/$input_script" >"$problem_file" <"$2"
else
    echo "provide more parameters"
    exit 1
fi

cd -


echo compiling parser

g++ parser.cpp -o parser

echo running $ff ...

$ff -o dominio.pddl -f "$problem_file" | tee "$tmp1"

grep REALIZAR-EJERCICIO "$tmp1" | cut -c 12- | ./parser
