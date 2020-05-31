(define (problem planning1) (domain planner)
(:objects
    e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 e17 e18 e19 e20 e21 e22 e23 e24 e25 - ejercicio
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - dia
    n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - nivel
)
(:init
    ;; orden dias
    (prev d1  d2)  (prev d1  d3)  (prev d1  d4)
    (prev d1  d5)  (prev d1  d6)  (prev d1  d7)
    (prev d1  d8)  (prev d1  d9)  (prev d1  d10)
    (prev d1  d11) (prev d1  d12) (prev d1  d13)
    (prev d1  d14) (prev d1  d15)

    (prev d2  d3)  (prev d2  d4)  (prev d2  d5)
    (prev d2  d6)  (prev d2  d7)  (prev d2  d8)
    (prev d2  d9)  (prev d2  d10) (prev d2  d11)
    (prev d2  d12) (prev d2  d13) (prev d2  d14)
    (prev d2  d15)

    (prev d3  d4)  (prev d3  d5)  (prev d3  d6)
    (prev d3  d7)  (prev d3  d8)  (prev d3  d9)
    (prev d3  d10) (prev d3  d11) (prev d3  d12)
    (prev d3  d13) (prev d3  d14) (prev d3  d15)

    (prev d4  d5)  (prev d4  d6)  (prev d4  d7)
    (prev d4  d8)  (prev d4  d9)  (prev d4  d10)
    (prev d4  d11) (prev d4  d12) (prev d4  d13)
    (prev d4  d14) (prev d4  d15)

    (prev d5  d6)  (prev d5  d7)  (prev d5  d8)
    (prev d5  d9)  (prev d5  d10) (prev d5  d11)
    (prev d5  d12) (prev d5  d13) (prev d5  d14)
    (prev d5  d15)

    (prev d6  d7)  (prev d6  d8)  (prev d6  d9)
    (prev d6  d10) (prev d6  d11) (prev d6  d12)
    (prev d6  d13) (prev d6  d14) (prev d6  d15)

    (prev d7  d8)  (prev d7  d9)  (prev d7  d10)
    (prev d7  d11) (prev d7  d12) (prev d7  d13)
    (prev d7  d14) (prev d7  d15)

    (prev d8  d9)  (prev d8  d10) (prev d8  d11)
    (prev d8  d12) (prev d8  d13) (prev d8  d14)
    (prev d8  d15)

    (prev d9  d10) (prev d9  d11) (prev d9  d12)
    (prev d9  d13) (prev d9  d14) (prev d9  d15)

    (prev d10 d11) (prev d10 d12) (prev d10 d13)
    (prev d10 d14) (prev d10 d15)

    (prev d11 d12) (prev d11 d13) (prev d11 d14)
    (prev d11 d15)

    (prev d12 d13) (prev d12 d14) (prev d12 d15)

    (prev d13 d14) (prev d13 d15)

    (prev d14 d15)

    ;orden niveles
    (next n1 n2)
    (next n2 n3)
    (next n3 n4)
    (next n4 n5)
    (next n5 n6)
    (next n6 n7)
    (next n7 n8)
    (next n8 n9)
    (next n9 n10)

    ;; ejercicios preparadores
    (preparador e1 e2)
    (preparador e3 e4)
    (preparador e5 e6)
    (preparador e8 e9)
    (preparador e12 e13)
    (preparador e17 e18)
    (preparador e20 e21)
    (preparador e21 e22)
    (preparador e25 e26)

    ;; ejercicios predecesores
    ; TODO: (predecesor e2 e3) ;...

    ;; ejercicos que NO está haciendo
    (LastLvl e1 n1)
    (LastLvl e3 n1)
    (LastLvl e4 n1)
    (LastLvl e5 n1)
    (LastLvl e7 n1)
    (LastLvl e8 n1)
    (LastLvl e10 n1)
    (LastLvl e11 n1)
    (LastLvl e12 n1)
    (LastLvl e13 n1)
    (LastLvl e14 n1)
    (LastLvl e15 n1)
    (LastLvl e17 n1)
    (LastLvl e18 n1)
    (LastLvl e19 n1)
    (LastLvl e20 n1)
    (LastLvl e21 n1)
    (LastLvl e23 n1)
    (LastLvl e24 n1)

    ;; ejercicios que SI está haciendo
    (LastLvl e2 n3)
    (LastLvl e6 n4)
    (LastLvl e9 n5)
    (LastLvl e16 n6)
    (LastLvl e22 n7)
    (LastLvl e25 n8)

    ;; objetivos que quiere alcanzar
    ; TODO: probar de quitar alguno para que no sean todos los que esta haciendo)
    (objetivo e2 n10)
    (objetivo e6 n6)
    (objetivo e9 n9)
    (objetivo e16 n9)
    (objetivo e22 n8)
    (objetivo e25 n10)
)
(:goal
    (forall (?ej - ejercicio ?n - nivel)
        (imply (objetivo ?ej ?n) (LastLvl ?ej ?n))
    )
)
)
