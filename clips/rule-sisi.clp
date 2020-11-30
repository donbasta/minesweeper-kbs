; ---------------------------------------------------------
(defrule sisi_angka_satu_ada_bom_adj ;1 unknown, 4 sisanya fix bukan bom

(sisi ?a ?b)
(isi ?a ?b 1)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(not (bomb ?x2 ?y2))

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(not (unknown ?x4 ?y4))
(not (bomb ?x4 ?y4))

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(not (unknown ?x5 ?y5))
(not (bomb ?x5 ?y5))

=>

(retract ?r1)
(assert (bomb ?x1 ?y1))
)
; ---------------------------------------------------------
(defrule sisi_angka_dua_dua_bom_tiga_kosong ;2 unknown, 3 sisanya fix bukan bom

(sisi ?a ?b)
(isi ?a ?b 2)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(unknown ?x2 ?y2)
?r2 <- (unknown ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(not (unknown ?x4 ?y4))
(not (bomb ?x4 ?y4))

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(not (unknown ?x5 ?y5))
(not (bomb ?x5 ?y5))

=>
(retract ?r1)
(retract ?r2)
(assert (bomb ?x1 ?y1))
(assert (bomb ?x2 ?y2))
)
; ---------------------------------------------------------
(defrule sisi_angka_tiga_tiga_bom_dua_kosong ;3 unknown, 2 sisanya fix bukan bom

(sisi ?a ?b)
(isi ?a ?b 3)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(unknown ?x2 ?y2)
?r2 <- (unknown ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(unknown ?x3 ?y3)
?r3 <- (unknown ?x3 ?y3)

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(not (unknown ?x4 ?y4))
(not (bomb ?x4 ?y4))

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(not (unknown ?x5 ?y5))
(not (bomb ?x5 ?y5))

=>
(retract ?r1)
(retract ?r2)
(retract ?r3)
(assert (bomb ?x1 ?y1))
(assert (bomb ?x2 ?y2))
(assert (bomb ?x2 ?y3))
)