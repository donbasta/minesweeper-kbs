deffunction factorial (?a)
    (if (or (not (integerp ?a)) (< ?a 0)) then
        (printout t "Factorial Error!" crlf)
     else
        (if (= ?a 0) then
            1
         else
            (* ?a (factorial (- ?a 1))))))


(defrule expand_satu
    (isi ?i ?j 1)
    ; (test (< (+ ?i 1) 4))
    ; (test (< (+ ?j 1) 4))
    (unknown ?a1 ?j)
    (unknown ?a2&~?a1 ?j)
    (unknown ?i ?b1)
    (unknown ?i ?b2~?b1)
    (unknown ?a3 ?b3)
    (unknown ?a4 ?b4)
    (unknown ?a5 ?b5)
    (unknown ?a6 ?b6)
    ?R1 <- (unknown ?a1 ?j)
    ?R2 <- (unknown ?a2&~?a1 ?j)
    ?R3 <- (unknown ?i ?b1)
    ?R4 <- (unknown ?i ?b2~?b1)
    ?R5 <- (unknown ?a3 ?b3)
        (unknown ?a4 ?b4)
        (unknown ?a5 ?b5)
        (unknown ?a6 ?b6)
    ?i
    =>
    (
        if (and (= (+ ?i 1) ?a) (= (+ ?j 1) ?b))
        then 
            (assert (safe-box ?a ?j))
            (retract ?f)
            (assert (ask-isi ?a ?j))
            (assert (safe-box ?i ?b))
            (retract ?g)
            (assert (ask-isi ?i ?b))
            (assert (safe-box ?a ?b))
            (retract ?h)
            (assert (ask-isi ?a ?b))
    )
)