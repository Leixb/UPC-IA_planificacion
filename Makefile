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
	$(FF) -o basico.pddl -f problema.pddl | tee tmp1 | grep REALIZAR-EJERCICIO | cut -c 12- | ./parse >tmp2
	@cat tmp1
	@cat tmp2
	@rm tmp1 tmp2
