FF = ff

all:
	run

problema.pddl: generar-input.py
	python3 generar-input.py >problema.pddl

run: problema.pddl
	$(FF) -o basico.pddl -f problema.pddl

parse: parse.cpp
	g++ parse.cpp -o parse

test: parse problema.pddl
	$(FF) -o basico.pddl -f problema.pddl | grep REALIZAR-EJERCICO | cut -c 12- | ./parse
