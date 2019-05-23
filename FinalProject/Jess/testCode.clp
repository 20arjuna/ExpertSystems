(clear)
(reset)


(defrule tes
    (p n)
    =>
    (printout t "fish!" crlf)
)

(run)
