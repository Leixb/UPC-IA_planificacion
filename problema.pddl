(define (problem planning1) (domain planner)
(:objects
    e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 e17 e18 e19 e20 e21 e22 e23 e24 e25 - ejercicio
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - dia
    n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - nivel
)
(:init
    (preparador e1 e2)
    (preparador e3 e4)
    (preparador e5 e6)
    (preparador e8 e9)
    (preparador e12 e13)
    (preparador e17 e18)
    (preparador e20 e21)
    (preparador e21 e22)
    (preparador e25 e26)
)
(:goal
    (forall (?ej - ejercicio ?n - nivel)
        (imply (objetivo ?ej ?n) (LastLvl ?ej ?n))
    )
)
)
