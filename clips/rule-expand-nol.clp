(defrule expand_nol_pojok
    (declare (salience 1000))
    (pojok ?i ?j)
    (isi ?i ?j 0)
    (adjacent ?x1 ?y1 ?i ?j)
    (unknown ?x1 ?y1)
    ?r1 <- (unknown ?x1 ?y1)
    =>
    (retract ?r1)
    (assert(ask-isi ?x1 ?y1))
)

(defrule expand_nol_sisi
    (declare (salience 999))
    (sisi ?i ?j)
    (isi ?i ?j 0)
    (adjacent ?x1 ?y1 ?i ?j)
    (unknown ?x1 ?y1)
    ?r1 <- (unknown ?x1 ?y1)
    =>
    (retract ?r1)
    (assert(ask-isi ?x1 ?y1))
)

(defrule expand_nol_tengah
    (declare (salience 998))
    (tengah ?i ?j)
    (isi ?i ?j 0)
    (adjacent ?a1 ?b1 ?i ?j)
    (unknown ?a1 ?b1)
    ?r1 <- (unknown ?a1 ?b1)
=>
    (retract ?r1)
    (assert (ask-isi ?a1 ?b1))
)

; (defrule expand_nol_tengah_buka_dua ;buka
;     (sisi ?i ?j)
;     (isi ?i ?j 0)
;     (adjacent ?a1 ?b1 ?i ?j)
;     (unknown ?a1 ?b1)
;     r1 <- (unknown ?a1 ?b1)
;     (adjacent ?a2 ?b2 ?i ?j)
;     (test not((and (= ?a1 ?b1) (= ?a2 ?b2))))
;     (unknown ?a2 ?b2)
;     r2 <- (unknown ?a2 ?b2)
; =>
;     (assert (ask-isi ?a1 ?b1))
;     (retract r1)
;     (assert (ask-isi ?a2 ?b2))
;     (retract r2)
; )

; (defrule expand_nol_tengah_buka_tiga ;buka
;     (sisi ?i ?j)
;     (isi ?i ?j 0)

;     (adjacent ?a1 ?b1 ?i ?j)
;     (unknown ?a1 ?b1)
;     r1 <- (unknown ?a1 ?b1)

;     (adjacent ?a2 ?b2 ?i ?j)
;     (test not((and (= ?a1 ?a2) (= ?b1 ?b2))))
;     (unknown ?a2 ?b2)
;     r2 <- (unknown ?a2 ?b2)

;     (adjacent ?a3 ?b3 ?i ?j)
;     (test not((and (= ?a1 ?a3) (= ?b1 ?b3))))
;     (test not((and (= ?a2 ?a3) (= ?b2 ?b3))))
;     (unknown ?a3 ?b3)
;     r3 <- (unknown ?a3 ?b3)
; =>
;     (assert (ask-isi ?a1 ?b1))
;     (retract r1)
;     (assert (ask-isi ?a2 ?b2))
;     (retract r2)
;     (assert (ask-isi ?a3 ?b3))
;     (retract r3)
; )

; (defrule expand_nol_tengah_buka_empat ;buka
;     (sisi ?i ?j)
;     (isi ?i ?j 0)

;     (adjacent ?a1 ?b1 ?i ?j)
;     (unknown ?a1 ?b1)
;     r1 <- (unknown ?a1 ?b1)

;     (adjacent ?a2 ?b2 ?i ?j)
;     (test not((and (= ?a1 ?a2) (= ?b1 ?b2))))
;     (unknown ?a2 ?b2)
;     r2 <- (unknown ?a2 ?b2)

;     (adjacent ?a3 ?b3 ?i ?j)
;     (test not((and (= ?a1 ?a3) (= ?b1 ?b3))))
;     (test not((and (= ?a2 ?a3) (= ?b2 ?b3))))
;     (unknown ?a3 ?b3)
;     r3 <- (unknown ?a3 ?b3)
; =>
;     (assert (ask-isi ?a1 ?b1))
;     (retract r1)
;     (assert (ask-isi ?a2 ?b2))
;     (retract r2)
;     (assert (ask-isi ?a3 ?b3))
;     (retract r3)
; )