(defrule pattern_1 ;1-1 pattern from closed square
;There is 1 mine in the first two squares, and 1 mine in the first three squares. 
;The 3rd square over must be empty.
    ; (printout t "Bebas -1" crlf)
    (sisi ?a1 ?b1)
    (isi ?a1 ?b1 ?c)
    (test (= ?c 1))
    (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
    (tengah ?a2 ?b2)
    (isi ?a2 ?b2 ?d)
    (test (= ?d 1))
    ; (printout t "Bebas 0" crlf)
    (adjacent-by-edge ?a1 ?b1 ?a3 ?b3)
    (test (not (and (= ?a3 ?a2) (= ?b3 ?b2))))
    (unknown ?a3 ?b3)
    (adjacent-by-edge ?a1 ?b1 ?a4 ?b4)
    ; (printout t "Bebas 1" crlf)
    (test (not (and (= ?a4 ?a2) (= ?b4 ?b2))))
    (test (not (and (= ?a4 ?a3) (= ?b4 ?b3))))
    ; (printout t "tesuto: " ?a4 ?b4 crlf)
    (not (unknown ?a4 ?b4))
    (not (bomb ?a4 ?b4))
    (adjacent-by-edge ?a3 ?b3 ?a5 ?b5)
    (adjacent-by-edge ?a2 ?b2 ?a5 ?b5)
    (test (not (and (= ?a5 ?a1) (= ?b5 ?b1))))
    (unknown ?a5 ?b5)
    ; ; (printout t "Bebas 2" crlf)
    (adjacent-by-edge ?a4 ?b4 ?a6 ?b6)
    (adjacent-by-edge ?a2 ?b2 ?a6 ?b6)
    (test (not (and (= ?a6 ?a1) (= ?b6 ?b1))))
    (not (unknown ?a6 ?b6))
    (not (bomb ?a6 ?b6))
    (successive ?a1 ?b1 ?a2 ?b2 ?a7 ?b7)
    (not (unknown ?a7 ?b7))
    (not (bomb ?a7 ?b7))
    ; ; (printout t "Bebas 3" crlf)
    (adjacent-by-edge ?a5 ?b5 ?a8 ?b8)
    (adjacent-by-edge ?a7 ?b7 ?a8 ?b8)
    (test (not (and (= ?a8 ?a2) (= ?b8 ?b2))))
    ; ; (printout t "Bebas 4" crlf)
    (unknown ?a8 ?b8)
    ?r8 <- (unknown ?a8 ?b8)
    (adjacent-by-edge ?a7 ?b7 ?a9 ?b9)
    (adjacent-by-edge ?a6 ?b6 ?a9 ?b9)
    (test (not (and (= ?a9 ?a2) (= ?b9 ?b2))))
    (not (unknown ?a9 ?b9))
    (not (bomb ?a9 ?b9))

=>
    ;a8 b8 aman
    ; (printout t "tesuto: " ?a1 " " ?b1 crlf)
    ; (printout t "tesuto: " ?a2 " " ?b2 crlf)
    ; (printout t "tesuto: " ?a3 " " ?b3 crlf)
    ; (printout t "tesuto: " ?a4 " " ?b4 crlf)
    ; (printout t "tesuto: " ?a5 " " ?b5 crlf)
    ; (printout t "tesuto: " ?a6 " " ?b6 crlf)
    ; (printout t "tesuto: " ?a7 " " ?b7 crlf)
    ; (printout t "tesuto: " ?a8 " " ?b8 crlf)
    ; (printout t "tesuto: " ?a9 " " ?b9 crlf)
    ; (printout t "Bebas momati" crlf)
    (assert (ask-isi ?a8 ?b8))
    ; ; (assert (safe ?a8 ?b8))
    (retract ?r8)
)

(defrule pattern_1_1
;There is 1 mine in the first two squares, and 1 mine in the first three squares. 
;The 3rd square over must be empty.
    (coordinate ?a1 ?b1)
    (pojok ?a1 ?b1)
    (isi ?a1 ?b1 1)
    (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
    (tengah ?a2 ?b2)
    (isi ?a2 ?b2 1)
    (adjacent-by-edge ?a1 ?b1 ?a3 ?b3)
    (test (not(and (= ?a3 ?a2) (= ?b3 ?b2))))
    (unknown ?a3 ?b3)
    (adjacent-by-edge ?a3 ?b3 ?a5 ?b5)
    (adjacent-by-edge ?a2 ?b2 ?a5 ?b5)
    (test (not(and (= ?a5 ?a1) (= ?b5 ?b1))))
    (unknown ?a5 ?b5)
    (successive ?a1 ?b1 ?a2 ?b2 ?a7 ?b7)
    (not (unknown ?a7 ?b7))
    (not (bomb ?a7 ?b7))
    (adjacent-by-edge ?a5 ?b5 ?a8 ?b8)
    (adjacent-by-edge ?a7 ?b7 ?a8 ?b8)
    (test (not(and (= ?a8 ?a2) (= ?b8 ?b2))))
    (unknown ?a8 ?b8)
    ?r8 <- (unknown ?a8 ?b8)

=>
    ;a8 b8 aman
    (assert (ask-isi ?a8 ?b8))
    (retract ?r8)
)

; (defrule pattern_2 ;1-2 pattern from closed square
; ;There is 1 mine in the first two squares, and 1 mine in the first three squares. 
; ;The 3rd square over must be empty.
;     (coordinate ?a1 ?b1)
;     (sisi ?a1 ?b1)
;     (isi ?a1 ?b1 1)
;     (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
;     (tengah ?a2 ?b2)
;     (isi ?a2 ?b2 2)
;     (adjacent-by-edge ?a1 ?b1 ?a3 ?b3)
;     (test (not((and (= ?a3 ?a2) (= ?b3 ?b2))))
;     (unknown ?a3 ?b3)
;     (adjacent-by-edge ?a1 ?b1 ?a4 ?b4)
;     (test (not((and (= ?a4 ?a2) (= ?b4 ?b2))))
;     (test (not((and (= ?a4 ?a3) (= ?b4 ?a3))))
;     (not (unknown ?a4 ?b4))
;     (not (bomb ?a4 ?b4))
;     (adjacent-by-edge ?a3 ?b3 ?a5 ?b5)
;     (adjacent-by-edge ?a2 ?b2 ?a5 ?b5)
;     (test (not((and (= ?a5 ?a1) (= ?b5 ?b1))))
;     (unknown ?a5 ?b5)
;     (adjacent-by-edge ?a4 ?b4 ?a6 ?b6)
;     (adjacent-by-edge ?a2 ?b2 ?a6 ?b6)
;     (test (not((and (= ?a6 ?a1) (= ?b6 ?b1))))
;     (not (unknown ?a6 ?b6))
;     (not (bomb ?a6 ?b6))
;     (successive ?a1 ?b1 ?a2 ?b2 ?a7 ?b7)
;     (not (unknown ?a7 ?b7))
;     (not (bomb ?a7 ?b7))
;     (adjacent-by-edge ?a5 ?b5 ?a8 ?b8)
;     (adjacent-by-edge ?a7 ?b7 ?a8 ?b8)
;     (test (not((and (= ?a8 ?a2) (= ?b8 ?b2))))
;     (unknown ?a8 ?b8)
;     ?r8 <- (unknown ?a8 ?b8)
;     (adjacent-by-edge ?a7 ?b7 ?a9 ?b9)
;     (adjacent-by-edge ?a6 ?b6 ?a9 ?b9)
;     (test (not((and (= ?a9 ?a2) (= ?b9 ?b2))))
;     (not (unknown ?a9 ?b9))
;     (not (bomb ?a9 ?b9))

; =>
;     ;a8 b8 aman
;     (assert (bomb ?a8 ?b8))
;     (retract ?r8)
; )

; (defrule pattern_2_1
; ;There is 1 mine in the first two squares, and 1 mine in the first three squares. 
; ;The 3rd square over must be empty.
;     (coordinate ?a1 ?b1)
;     (pojok ?a1 ?b1)
;     (isi ?a1 ?b1 1)
;     (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
;     (tengah ?a2 ?b2)
;     (isi ?a2 ?b2 2)
;     (adjacent-by-edge ?a1 ?b1 ?a3 ?b3)
;     (test (not((and (= ?a3 ?a2) (= ?b3 ?b2))))
;     (unknown ?a3 ?b3)
;     (adjacent-by-edge ?a3 ?b3 ?a5 ?b5)
;     (adjacent-by-edge ?a2 ?b2 ?a5 ?b5)
;     (test (not((and (= ?a5 ?a1) (= ?b5 ?b1))))
;     (unknown ?a5 ?b5)
;     (successive ?a1 ?b1 ?a2 ?b2 ?a7 ?b7)
;     (not (unknown ?a7 ?b7))
;     (not (bomb ?a7 ?b7))
;     (adjacent-by-edge ?a5 ?b5 ?a8 ?b8)
;     (adjacent-by-edge ?a7 ?b7 ?a8 ?b8)
;     (test (not((and (= ?a8 ?a2) (= ?b8 ?b2))))
;     (unknown ?a8 ?b8)
;     ?r8 <- (unknown ?a8 ?b8)

; =>
;     ;a8 b8 aman
;     (assert (bomb ?a8 ?b8))
;     (retract ?r8)
; )

; (defrule pattern_3 ;1-1 pattern from open square
;     (coordinate ?a1 ?b1)
;     (isi ?a1 ?b1 1)
;     (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
;     (isi ?a2 ?b2 1)

;     (adjacent ?a3 ?b3 ?a1 ?b1)
;     ;cek a3 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a3 ?a2) (= ?b3 ?b2))))
;     (unknown ?a3 ?b3)

;     (adjacent ?a4 ?a4 ?a1 ?b1)
;     ;cek a4 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a4 ?a3) (= ?b4 ?b3))))
;     (test (not((and (= ?a4 ?a2) (= ?b4 ?b2))))
;     (unknown ?a4 ?b4)

;     (adjacent ?a5 ?b5 ?a1 ?b1)
;     ;cek a5 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a5 ?a4) (= ?b5 ?b4))))
;     (test (not((and (= ?a5 ?a3) (= ?b5 ?b3))))
;     (test (not((and (= ?a5 ?a2) (= ?b5 ?b2))))
;     (safe ?a5 ?b5)

;     (adjacent ?a6 ?b6 ?a1 ?b1)
;     ;cek a6 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a6 ?a5) (= ?b6 ?b5))))
;     (test (not((and (= ?a6 ?a4) (= ?b6 ?b4))))
;     (test (not((and (= ?a6 ?a3) (= ?b6 ?b3))))
;     (test (not((and (= ?a6 ?a2) (= ?b6 ?b2))))
;     (safe ?a6 ?b6)

;     (adjacent ?a7 ?b7 ?a1 ?b1)
;     ;cek a7 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a7 ?a6) (= ?b7 ?b6))))
;     (test (not((and (= ?a7 ?a5) (= ?b7 ?b5))))
;     (test (not((and (= ?a7 ?a4) (= ?b7 ?b4))))
;     (test (not((and (= ?a7 ?a3) (= ?b7 ?b3))))
;     (test (not((and (= ?a7 ?a2) (= ?b7 ?b2))))
;     (safe ?a7 ?b7)

;     (adjacent ?a8 ?b8 ?a1 ?b1)
;     ;cek a8 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a8 ?a7) (= ?b8 ?b7))))
;     (test (not((and (= ?a8 ?a6) (= ?b8 ?b6))))
;     (test (not((and (= ?a8 ?a5) (= ?b8 ?b5))))
;     (test (not((and (= ?a8 ?a4) (= ?b8 ?b4))))
;     (test (not((and (= ?a8 ?a3) (= ?b8 ?b3))))
;     (test (not((and (= ?a8 ?a2) (= ?b8 ?b2))))
;     (safe ?a8 ?b8)

;     (adjacent ?a9 ?b9 ?a1 ?b1)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a9 ?a8) (= ?b9 ?b8))))
;     (test (not((and (= ?a9 ?a7) (= ?b9 ?b7))))
;     (test (not((and (= ?a9 ?a6) (= ?b9 ?b6))))
;     (test (not((and (= ?a9 ?a5) (= ?b9 ?b5))))
;     (test (not((and (= ?a9 ?a4) (= ?b9 ?b4))))
;     (test (not((and (= ?a9 ?a3) (= ?b9 ?b3))))
;     (test (not((and (= ?a9 ?a2) (= ?b9 ?b2))))
;     (safe ?a9 ?b9)

;     (adjacent-by-edge ?a3 ?b3 ?a4 ?b4)
;     (adjacent-by-edge ?a3 ?b3 ?a2 ?b2)
;     (adjacent ?a4 ?b4 ?a2 ?b2)

;     (adjacent ?a5 ?b5 ?a2 ?b2)
;     (adjacent ?a6 ?b6 ?a2 ?b2)

;     (adjacent ?a10 ?b10 ?a2 ?b2)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a10 ?a6) (= ?b10 ?b6))))
;     (test (not((and (= ?a10 ?a5) (= ?b10 ?b5))))
;     (test (not((and (= ?a10 ?a4) (= ?b10 ?b4))))
;     (test (not((and (= ?a10 ?a3) (= ?b10 ?b3))))
;     (test (not((and (= ?a10 ?a1) (= ?b10 ?b1))))
;     (safe ?a10 ?b10)

;     (adjacent ?a11 ?b11 ?a2 ?b2)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a11 ?a10) (= ?b11 ?b10))))
;     (test (not((and (= ?a11 ?a6) (= ?b11 ?b6))))
;     (test (not((and (= ?a11 ?a5) (= ?b11 ?b5))))
;     (test (not((and (= ?a11 ?a4) (= ?b11 ?b4))))
;     (test (not((and (= ?a11 ?a3) (= ?b11 ?b3))))
;     (test (not((and (= ?a11 ?a1) (= ?b11 ?b1))))
;     (safe ?a11 ?b11)

;     (adjacent ?a12 ?b12 ?a2 ?b2)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a12 ?a11) (= ?b12 ?b11))))
;     (test (not((and (= ?a12 ?a10) (= ?b12 ?b10))))
;     (test (not((and (= ?a12 ?a6) (= ?b12 ?b6))))
;     (test (not((and (= ?a12 ?a5) (= ?b12 ?b5))))
;     (test (not((and (= ?a12 ?a4) (= ?b12 ?b4))))
;     (test (not((and (= ?a12 ?a3) (= ?b12 ?b3))))
;     (test (not((and (= ?a12 ?a1) (= ?b12 ?b1))))
;     (unknown ?a12 ?b12)
;     ?r12 <- (unknown ?a12 ?b12)

;     (successive ?a4 ?b4 ?a3 ?b3 ?a12 ?b12)

; =>

;     (assert (safe ?a12 ?b12))
;     (retract ?r12)
; )

; (defrule pattern_3_1 ;1-1 pattern from open square
;     (coordinate ?a1 ?b1)
;     (sisi ?a1 ?b1)
;     (isi ?a1 ?b1 1)
;     (adjacent-by-edge ?a1 ?b1 ?a2 ?b2)
;     (sisi ?a2 ?b2)
;     (isi ?a2 ?b2 1)

;     (adjacent ?a3 ?b3 ?a1 ?b1)
;     ;cek a3 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a3 ?a2) (= ?b3 ?b2))))
;     (unknown ?a3 ?b3)

;     (adjacent ?a4 ?a4 ?a1 ?b1)
;     ;cek a4 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a4 ?a3) (= ?b4 ?b3))))
;     (test (not((and (= ?a4 ?a2) (= ?b4 ?b2))))
;     (unknown ?a4 ?b4)

;     (adjacent ?a5 ?b5 ?a1 ?b1)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a5 ?a4) (= ?b5 ?b4))))
;     (test (not((and (= ?a5 ?a3) (= ?b5 ?b3))))
;     (test (not((and (= ?a5 ?a2) (= ?b5 ?b2))))
;     (safe ?a5 ?b5)

;     (adjacent ?a6 ?b6 ?a1 ?b1)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a6 ?a5) (= ?b6 ?b5))))
;     (test (not((and (= ?a6 ?a4) (= ?b6 ?b4))))
;     (test (not((and (= ?a6 ?a3) (= ?b6 ?b3))))
;     (test (not((and (= ?a6 ?a2) (= ?b6 ?b2))))
;     (safe ?a6 ?b6)

;     (adjacent-by-edge ?a3 ?b3 ?a4 ?b4)
;     (adjacent-by-edge ?a3 ?b3 ?a2 ?b2)
;     (adjacent ?a4 ?b4 ?a2 ?b2)

;     (adjacent ?a7 ?b7 ?a2 ?b2)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a7 ?a4) (= ?b7 ?b4))))
;     (test (not((and (= ?a7 ?a3) (= ?b7 ?b3))))
;     (test (not((and (= ?a7 ?a1) (= ?b7 ?b1))))
;     (safe ?a7 ?b7)

;     (adjacent ?a8 ?b8 ?a2 ?b2)
;     ;cek a9 beda sama yang sebelum-sebelumnya
;     (test (not((and (= ?a8 ?a7) (= ?b8 ?b7))))
;     (test (not((and (= ?a8 ?a4) (= ?b8 ?b4))))
;     (test (not((and (= ?a8 ?a3) (= ?b8 ?b3))))
;     (test (not((and (= ?a8 ?a1) (= ?b8 ?b1))))
;     (unknown ?a8 ?b8)
;     ?r12 <- (unknown ?a12 ?b12)

;     (successive ?a4 ?b4 ?a3 ?b3 ?a8 ?b8)

; =>

;     (assert (safe ?a8 ?b8))
;     (retract ?r8)
; )


