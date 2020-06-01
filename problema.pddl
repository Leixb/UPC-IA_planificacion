;; numero de ejercicios: ;; 9
;; prep: ;;  {'1': ['3'], '3': ['9'], '7': ['5', '6'], '8': ['4']}
;; pred: ;;  {'1': '5', '3': '6', '8': '5'}
;; haciendo: ;;  {'1': '3', '3': '4', '5': '4', '7': '5', '8': '1', '9': '9'}
;; objetivos: ;;  {'1': '10', '3': '9', '5': '7', '7': '10', '8': '3'}
(define (problem planning1) (:domain planner)
(:objects
e1 e2 e3 e4 e5 e6 e7 e8 e9 - ejercicio
dummy - ejercicio
d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - dia
n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - nivel
) ;; end objects
(:init

;;	orden_dias


(prev d0 d1) 
(prev d0 d2) (prev d1 d2) 
(prev d0 d3) (prev d1 d3) (prev d2 d3) 
(prev d0 d4) (prev d1 d4) (prev d2 d4) (prev d3 d4) 
(prev d0 d5) (prev d1 d5) (prev d2 d5) (prev d3 d5) (prev d4 d5) 
(prev d0 d6) (prev d1 d6) (prev d2 d6) (prev d3 d6) (prev d4 d6) (prev d5 d6) 
(prev d0 d7) (prev d1 d7) (prev d2 d7) (prev d3 d7) (prev d4 d7) (prev d5 d7) (prev d6 d7) 
(prev d0 d8) (prev d1 d8) (prev d2 d8) (prev d3 d8) (prev d4 d8) (prev d5 d8) (prev d6 d8) (prev d7 d8) 
(prev d0 d9) (prev d1 d9) (prev d2 d9) (prev d3 d9) (prev d4 d9) (prev d5 d9) (prev d6 d9) (prev d7 d9) (prev d8 d9) 
(prev d0 d10) (prev d1 d10) (prev d2 d10) (prev d3 d10) (prev d4 d10) (prev d5 d10) (prev d6 d10) (prev d7 d10) (prev d8 d10) (prev d9 d10) 
(prev d0 d11) (prev d1 d11) (prev d2 d11) (prev d3 d11) (prev d4 d11) (prev d5 d11) (prev d6 d11) (prev d7 d11) (prev d8 d11) (prev d9 d11) (prev d10 d11) 
(prev d0 d12) (prev d1 d12) (prev d2 d12) (prev d3 d12) (prev d4 d12) (prev d5 d12) (prev d6 d12) (prev d7 d12) (prev d8 d12) (prev d9 d12) (prev d10 d12) (prev d11 d12) 
(prev d0 d13) (prev d1 d13) (prev d2 d13) (prev d3 d13) (prev d4 d13) (prev d5 d13) (prev d6 d13) (prev d7 d13) (prev d8 d13) (prev d9 d13) (prev d10 d13) (prev d11 d13) (prev d12 d13) 
(prev d0 d14) (prev d1 d14) (prev d2 d14) (prev d3 d14) (prev d4 d14) (prev d5 d14) (prev d6 d14) (prev d7 d14) (prev d8 d14) (prev d9 d14) (prev d10 d14) (prev d11 d14) (prev d12 d14) (prev d13 d14) 
(prev d0 d15) (prev d1 d15) (prev d2 d15) (prev d3 d15) (prev d4 d15) (prev d5 d15) (prev d6 d15) (prev d7 d15) (prev d8 d15) (prev d9 d15) (prev d10 d15) (prev d11 d15) (prev d12 d15) (prev d13 d15) (prev d14 d15) 

;;	orden_niveles

(next-nivel n0 n0) (next-nivel n0 n1)
(next-nivel n1 n1) (next-nivel n1 n2)
(next-nivel n2 n2) (next-nivel n2 n3)
(next-nivel n3 n3) (next-nivel n3 n4)
(next-nivel n4 n4) (next-nivel n4 n5)
(next-nivel n5 n5) (next-nivel n5 n6)
(next-nivel n6 n6) (next-nivel n6 n7)
(next-nivel n7 n7) (next-nivel n7 n8)
(next-nivel n8 n8) (next-nivel n8 n9)
(next-nivel n9 n9) (next-nivel n9 n10)

;;	dummy en los dias

(last d0 dummy) 
(last d1 dummy) 
(last d2 dummy) 
(last d3 dummy) 
(last d4 dummy) 
(last d5 dummy) 
(last d6 dummy) 
(last d7 dummy) 
(last d8 dummy) 
(last d9 dummy) 
(last d10 dummy) 
(last d11 dummy) 
(last d12 dummy) 
(last d13 dummy) 
(last d14 dummy) 
(last d15 dummy) 

;;	dummy ejercicio cada dia

(hecho dummy d0)
(hecho dummy d1)
(hecho dummy d2)
(hecho dummy d3)
(hecho dummy d4)
(hecho dummy d5)
(hecho dummy d6)
(hecho dummy d7)
(hecho dummy d8)
(hecho dummy d9)
(hecho dummy d10)
(hecho dummy d11)
(hecho dummy d12)
(hecho dummy d13)
(hecho dummy d14)
(hecho dummy d15)

;;	preparadores

(preparador e3 e1)
(preparador e9 e3)
(preparador e5 e7)
(preparador e6 e7)
(preparador e4 e8)

;;	predecesores

(predecesor e5 e1)
(predecesor e6 e3)
(predecesor e5 e8)
(predecesor dummy e2)
(predecesor e1 e2)
(predecesor e2 e2)
(predecesor e3 e2)
(predecesor e4 e2)
(predecesor e5 e2)
(predecesor e6 e2)
(predecesor e7 e2)
(predecesor e8 e2)
(predecesor e9 e2)
(predecesor dummy e4)
(predecesor e1 e4)
(predecesor e2 e4)
(predecesor e3 e4)
(predecesor e4 e4)
(predecesor e5 e4)
(predecesor e6 e4)
(predecesor e7 e4)
(predecesor e8 e4)
(predecesor e9 e4)
(predecesor dummy e5)
(predecesor e1 e5)
(predecesor e2 e5)
(predecesor e3 e5)
(predecesor e4 e5)
(predecesor e5 e5)
(predecesor e6 e5)
(predecesor e7 e5)
(predecesor e8 e5)
(predecesor e9 e5)
(predecesor dummy e6)
(predecesor e1 e6)
(predecesor e2 e6)
(predecesor e3 e6)
(predecesor e4 e6)
(predecesor e5 e6)
(predecesor e6 e6)
(predecesor e7 e6)
(predecesor e8 e6)
(predecesor e9 e6)
(predecesor dummy e7)
(predecesor e1 e7)
(predecesor e2 e7)
(predecesor e3 e7)
(predecesor e4 e7)
(predecesor e5 e7)
(predecesor e6 e7)
(predecesor e7 e7)
(predecesor e8 e7)
(predecesor e9 e7)
(predecesor dummy e9)
(predecesor e1 e9)
(predecesor e2 e9)
(predecesor e3 e9)
(predecesor e4 e9)
(predecesor e5 e9)
(predecesor e6 e9)
(predecesor e7 e9)
(predecesor e8 e9)
(predecesor e9 e9)

;;	Ejercicios hechos

(LastLvl e1 n3)
(realiza e1 n3 d0)
(LastLvl e3 n4)
(realiza e3 n4 d0)
(LastLvl e5 n4)
(realiza e5 n4 d0)
(LastLvl e7 n5)
(realiza e7 n5 d0)
(LastLvl e8 n1)
(realiza e8 n1 d0)
(LastLvl e9 n9)
(realiza e9 n9 d0)

;;	Ejercicios NO hechos

(LastLvl e2 n0)
(realiza e2 n0 d0)
(LastLvl e4 n0)
(realiza e4 n0 d0)
(LastLvl e6 n0)
(realiza e6 n0 d0)

;;	objetivos

(objetivo e1 n10)
(objetivo e3 n9)
(objetivo e5 n7)
(objetivo e7 n10)
(objetivo e8 n3)

;;	minutos_dia

(= (minutos-dia d1) 0)
(= (minutos-dia d2) 0)
(= (minutos-dia d3) 0)
(= (minutos-dia d4) 0)
(= (minutos-dia d5) 0)
(= (minutos-dia d6) 0)
(= (minutos-dia d7) 0)
(= (minutos-dia d8) 0)
(= (minutos-dia d9) 0)
(= (minutos-dia d10) 0)
(= (minutos-dia d11) 0)
(= (minutos-dia d12) 0)
(= (minutos-dia d13) 0)
(= (minutos-dia d14) 0)
(= (minutos-dia d15) 0)

;;	minutos_ejercicios

(= (minutos-haciendo e1) 2)
(= (minutos-descanso e1) 1)
(= (minutos-haciendo e2) 4)
(= (minutos-descanso e2) 2)
(= (minutos-haciendo e3) 6)
(= (minutos-descanso e3) 3)
(= (minutos-haciendo e4) 8)
(= (minutos-descanso e4) 4)
(= (minutos-haciendo e5) 10)
(= (minutos-descanso e5) 5)
(= (minutos-haciendo e6) 12)
(= (minutos-descanso e6) 6)
(= (minutos-haciendo e7) 14)
(= (minutos-descanso e7) 7)
(= (minutos-haciendo e8) 16)
(= (minutos-descanso e8) 8)
(= (minutos-haciendo e9) 18)
(= (minutos-descanso e9) 9)
(= (ej-prep) 0)
) ;; end init

;;	goal

(:goal
    (forall (?ej - ejercicio ?n - nivel)
        (imply (objetivo ?ej ?n) (LastLvl ?ej ?n))
    )
)
(:metric maximize (ej-prep))
) ;; end define
