#!/usr/bin/python3

DIAS = 15
NIVELES = 10
EJERCICIOS = 25
PROBLEM_NAME = "planning1"
DOMAIN = "planner"


def objects():
    print('(:objects')
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

    print(') ;; end objects')


def orden_dias():
    comment("orden_dias")

    for i in range(DIAS + 1):
        for j in range(i):
            print(f"(prev d{j} d{i})", end=" ")
        print()


def orden_niveles():
    comment("orden_niveles")

    for i in range(NIVELES):
        print(f"(next-nivel n{i} n{i+1})", end=" ")
        print()


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
        (imply (objetivo ?ej ?n) (LastLvl ?ej ?n))
    )
)"""
    )


def preparadores(l):
    comment("preparadores")
    req_prep = [False] * (EJERCICIOS + 1)
    for e, p in l.items():
        req_prep[e] = True
        for i in p:
            print(f'(preparador e{i} e{e})')

    comment("ej sin preparadores")
    for ej in range(1, EJERCICIOS + 1):
        if not req_prep[ej]:
            print(f"(preparador dummy e{ej})")


def predecesores(l):
    comment("predecesores")
    pass


def ejercicios_y_objetivos(haciendo, objetivo):
    hechos = [False] * (EJERCICIOS + 1)
    comment("Ejercicios hechos")

    for ej, lvl in haciendo:
        hechos[ej] = True
        print(f"(LastLvl e{ej} n{lvl})")
        print(f"(realiza e{ej} n{lvl} d0)")
    comment("Ejercicios NO hechos")

    for ej in range(1, EJERCICIOS + 1):
        if not hechos[ej]:
            print(f"(LastLvl e{ej} n0)")
            print(f"(realiza e{ej} n0 d0)")

    comment("objetivos")

    for ej, lvl in objetivo:
        print(f"(objetivo e{ej} n{lvl})")


def comment(text):
    print(f"\n;;\t{text}\n")


if __name__ == "__main__":
    print(f"(define (problem {PROBLEM_NAME}) (:domain {DOMAIN})")
    objects()
    print("(:init")
    orden_dias()
    orden_niveles()
    last_day()
    dummy_diario()

    preparadores(
        {1: [2], 3: [4], 5: [6], 8: [9], 12: [13], 17: [18], 20: [21], 21: [22], 24: [25]}
    )
    predecesores({})
    ejercicios_y_objetivos(
        # haciendo:
        [[2, 3], [6, 4], [9, 5], [16, 6], [22, 7], [25, 8]],
        # objetivos:
        [[2, 10], [6, 6], [9, 9], [16, 9], [22, 8], [25, 10]],
    )

    print(") ;; end init")
    goal()
    print(") ;; end define")
