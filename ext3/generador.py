#!/usr/bin/python

DIAS = 15
NIVELES = 10
EJERCICIOS = int(input(';; numero de ejercicios: '))
print(';;', EJERCICIOS)

PROBLEM_NAME = "planning1"
DOMAIN = "planner"


def objects():
    print("(:objects")

    for i in range(1, EJERCICIOS + 1):
        print(f"e{i}", end=" ")
    print("- ejercicio")
    print("dummy - ejercicio")

    for i in range(DIAS + 1):
        print(f"d{i}", end=" ")
    print("- dia")

    for i in range(NIVELES + 1):
        print(f"n{i}", end=" ")
    print("- nivel")

    print(") ;; end objects")


def orden_dias():
    comment("orden_dias")

    for i in range(DIAS + 1):
        for j in range(i):
            print(f"(prev d{j} d{i})", end=" ")
        print()


def orden_niveles():
    comment("orden_niveles")

    for i in range(NIVELES):
        print(f"(next-nivel n{i} n{i})", end=" ")
        print(f"(next-nivel n{i} n{i+1})")


def last_day():
    comment("dummy en los dias")

    for i in range(DIAS + 1):
        print(f"(last d{i} dummy)", end=" ")
        print()


def dummy_diario():
    comment("dummy ejercicio cada dia")

    for i in range(DIAS + 1):
        print(f"(hecho dummy d{i})")


def goal():
    comment("goal")
    print(
        """(:goal
    (forall (?ej - ejercicio ?n - nivel)
        (imply (objetivo ?ej ?n) (reached ?ej ?n))
    )
)"""
    )


def preparadores(l):
    comment("preparadores")
    req_prep = [False] * (EJERCICIOS + 1)

    for e, p in l.items():
        req_prep[int(e)] = True

        for i in p:
            print(f"(preparador e{i} e{e})")


def predecesores(l):
    comment("predecesores")
    req_pre = [False] * (EJERCICIOS + 1)

    for e, p in l.items():
        req_pre[int(e)] = True
        print(f"(predecesor e{p} e{e})")

    for e in range(1, EJERCICIOS + 1):
        if not req_pre[e]:
            print(f"(predecesor dummy e{e})")

            for p in range(1, EJERCICIOS + 1):
                print(f"(predecesor e{p} e{e})")


def ejercicios_y_objetivos(haciendo, objetivo):
    hechos = [False] * (EJERCICIOS + 1)
    comment("Ejercicios hechos")

    for ej, lvl in haciendo.items():
        hechos[int(ej)] = True
        print(f"(reached e{ej} n{lvl})")
        print(f"(realiza e{ej} n{lvl} d0)")
    comment("Ejercicios NO hechos")

    for ej in range(1, EJERCICIOS + 1):
        if not hechos[ej]:
            print(f"(reached e{ej} n0)")
            print(f"(realiza e{ej} n0 d0)")

    comment("objetivos")

    for ej, lvl in objetivo.items():
        print(f"(objetivo e{ej} n{lvl})")

def ejercicios_dia():

    comment("ejercicios_dia")

    for i in range(1, DIAS + 1):
        print(f"(= (ejercicios-dia d{i}) 0)")


def comment(text):
    print(f"\n;;\t{text}\n")


if __name__ == "__main__":
    txt = input(';; prep: ')
    l = [x.split(':') for x in txt.replace(' ','').split(';')]
    prep = {}
    if len(l) > 1:
        prep = {k: v.split(',') for k, v in l}
    print(";; ", prep)

    txt = input(';; pred: ')
    try:
        pred = dict(x.split(':') for x in txt.replace(' ','').split(';'))
    except ValueError:
        pred = {}
    print(";; ", pred)

    txt = input(';; haciendo: ')
    haciendo = dict(x.split(':') for x in txt.replace(' ','').split(';'))
    print(";; ", haciendo)

    txt = input(';; objetivos: ')
    objetivos = dict(x.split(':') for x in txt.replace(' ','').split(';'))
    print(";; ", objetivos)


    print(f"(define (problem {PROBLEM_NAME}) (:domain {DOMAIN})")
    objects()
    print("(:init")
    orden_dias()
    orden_niveles()
    last_day()
    dummy_diario()


    preparadores(prep)
    predecesores(pred)

    ejercicios_y_objetivos(haciendo, objetivos)

    ejercicios_dia()

    print(") ;; end init")
    goal()

    print(") ;; end define")
