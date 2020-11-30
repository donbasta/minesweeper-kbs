(defrule startup
  =>
  (assert 
          (rain November)
          (chaos November))
)

(defrule R
    (chaos November)
    (rain November)
  =>
  (assert (sad November))
)

(defrule S
    (rain November)
  =>
  (assert (mentally-exhausted November))
)
