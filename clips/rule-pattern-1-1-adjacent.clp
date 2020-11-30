(defrule pattern_satu_dan_satu_adjacent
;There is 1 mine in the first two squares, and 1 mine in the first three squares. 
;The 3rd square over must be empty.

    ; (coordinate ?a1 ?b1)
    (isi ?a1 ?b1 1)
    (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
    (isi ?a2 ?b2 1)

    (adjacent ?a3 ?b3 ?a1 ?b1)
    ;cek a3 beda sama yang sebelum-sebelumnya
    (test (not(and (= ?a3 ?a2) (= ?b3 ?b2))))
    (not (unknown ?a3 ?b3))
    (not (bomb ?a3 ?b3))
    (not (adjacent ?a3 ?b3 ?a2 ?b2))

    (adjacent ?a4 ?b4 ?a1 ?b1)
    ;cek a4 beda sama yang sebelum-sebelumnya
    (test (not(and (= ?a4 ?a3) (= ?b4 ?b3))))
    (test (not(and (= ?a4 ?a2) (= ?b4 ?b2))))
    (not (unknown ?a4 ?b4))
    (not (bomb ?a4 ?b4))
    (not (adjacent ?a4 ?b4 ?a2 ?b2))

    (adjacent ?a5 ?b5 ?a1 ?b1)
    ;cek a4 beda sama yang sebelum-sebelumnya
    (test (not(and (= ?a5 ?a4) (= ?b5 ?b4))))
    (test (not(and (= ?a5 ?a3) (= ?b5 ?b3))))
    (test (not(and (= ?a5 ?a2) (= ?b5 ?b2))))
    (not (unknown ?a5 ?b5))
    (not (bomb ?a5 ?b5))
    (not (adjacent ?a5 ?b5 ?a2 ?b2))

    (adjacent ?a6 ?b6 ?a2 ?b2)
    ;cek a4 beda sama yang sebelum-sebelumnya
    (test (not(and (= ?a6 ?a5) (= ?b6 ?b5))))
    (test (not(and (= ?a6 ?a4) (= ?b6 ?b4))))
    (test (not(and (= ?a6 ?a3) (= ?b6 ?b3))))
    (test (not(and (= ?a6 ?a1) (= ?b6 ?b1))))
    (not (adjacent ?a6 ?b6 ?a1 ?b1))
    (unknown ?a6 ?b6)
    ?r6 <- (unknown ?a6 ?b6)
=>
    (assert (ask-isi ?a6 ?b6))
    (retract ?r6)
)

(defrule pattern_satu_dan_satu_adjacent_di_sisi
;There is 1 mine in the first two squares, and 1 mine in the first three squares. 
;The 3rd square over must be empty.
    (isi ?a1 ?b1 1)
    (sisi ?a1 ?b1)
    (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
    (isi ?a2 ?b2 1)
    (sisi ?a2 ?b2)

    (adjacent ?a3 ?b3 ?a1 ?b1)
    ;cek a3 beda sama yang sebelum-sebelumnya
    (test (not(and (= ?a3 ?a2) (= ?b3 ?b2))))
    (not (unknown ?a3 ?b3))
    (not (bomb ?a3 ?b3))
    (not (adjacent ?a3 ?b3 ?a2 ?b2))

    (adjacent ?a4 ?b4 ?a1 ?b1)
    ;cek a4 beda sama yang sebelum-sebelumnya
    (test (not(and (= ?a4 ?a3) (= ?b4 ?b3))))
    (test (not(and (= ?a4 ?a2) (= ?b4 ?b2))))
    (not (unknown ?a4 ?b4))
    (not (bomb ?a4 ?b4))
    (not (adjacent ?a4 ?b4 ?a2 ?b2))

    (adjacent ?a5 ?b5 ?a2 ?b2)
    ;cek a4 beda sama yang sebelum-sebelumnya
    (not (adjacent ?a1 ?b1 ?a5 ?b5))
    (test (not(and (= ?a5 ?a4) (= ?b5 ?b4))))
    (test (not(and (= ?a5 ?a3) (= ?b5 ?b3))))
    (test (not(and (= ?a5 ?a1) (= ?b5 ?b1))))
    (unknown ?a5 ?b5)
    ?r5 <- (unknown ?a5 ?b5)
=>
    (assert (ask-isi ?a5 ?b5))
    (retract ?r5)
)