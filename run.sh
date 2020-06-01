#!/usr/bin/bash

problem_file="$(mktemp)"
input_script="./generar-input.py"

tmp1="$(mktemp)"

echo "debug files:"
echo " * problem -> $problem_file"
echo " * output  -> $tmp1"

ff="ff-metric"

if [ $# -eq 0 ]; then
    echo Please input problem data
    python3 "$input_script" | tee "$problem_file"
else
    python3 "$input_script" >"$problem_file" <"$1"
fi

echo running $ff ...

$ff -o basico.pddl -f "$problem_file" | tee "$tmp1"
grep REALIZAR-EJERCICIO "$tmp1" | cut -c 12- | ./parse
