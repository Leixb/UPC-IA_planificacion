(define (domain planner)
    (:requirements :strips :adl :typing)
    (:types ejercicio nivel dia)
    (:predicates
        (preparador ?x - ejercicio ?y - ejercicio)              ;; x preparador de y
        (objetivo ?x - ejercicio ?n - nivel)                    ;; objetivo ejercicio x a nivel n
        ;; orden de dias y nivel
        (prev ?x - dia ?y - dia)
        (next-nivel ?x - nivel ?y - nivel)
        ;; predicados auxiliares
        (last ?dia - dia ?ej - ejercicio)                       ;; ultimo ejeercicio del dia.
        (lastLvl ?ej - ejercicio ?n - nivel)                    ;; ultimo nivel del ejercicio
        (realiza ?x - ejercicio ?n - nivel ?d - dia)            ;; se realiza el ejercicio x con nivel n el dia d
        (hecho   ?e - ejercicio ?d - dia)
    )
    (:action realizar-ejercicio
        :parameters (?e - ejercicio ?prep - ejercicio ?n1 - nivel ?n2 - nivel ?d1 - dia ?d2 - dia ?prev - ejercicio)
        :precondition (and
            (realiza ?e ?n1 ?d1)
            (prev ?d1 ?d2)
            (next-nivel ?n1 ?n2)
            (not (hecho ?e ?d2))
            (last ?d2 ?prev)
            (lastLvl ?e ?n1)
            (preparador ?prep ?e)
            (hecho ?prep ?d2)
        )
        :effect (and
            (not (lastLvl ?e ?n1)) (lastLvl ?e ?n2)
            (realiza ?e ?n2 ?d2)
            (not (last ?d2 ?prev)) (last ?d2 ?e)
            (hecho ?e ?d2)
        )
    )
)
