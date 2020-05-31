(define (domain planner)
    (:requirements :strips :adl :typing)
    (:types ejercicio nivel dia)
    (:predicates
        (predecesor  ?x - ejercicio ?y - ejercicio)      ;; x predecesor de y
        (preparador ?x - ejercicio ?y - ejercicio)      ;; x preparador de y
        ;(haciendo ?x - ejercicio ?n - nivel)            ;; haciendo ejercicio x a nivel n
        (objetivo ?x - ejercicio ?n - nivel)            ;; objetivo ejercicio x a nivel n
        ;; orden de dias y nivel
        (prev ?x - dia ?y - dia)
        (next ?x - nivel ?y - nivel)
        ;; predicados auxiliares
        (next ?dia ?ej1 ?ej2)                           ;; orden de ejercicios en el dia ej1 < ej2
        (last ?dia ?ej)                                 ;; ultimo ejeercicio del dia.
        (lastLvl ?ej - ejercicio ?n - nivel)            ;; ultimo nivel del ejercicio
        (realiza ?x - ejercicio ?n - nivel ?d - dia)    ;; se realiza el ejercicio x con nivel n el dia d
    )
)
