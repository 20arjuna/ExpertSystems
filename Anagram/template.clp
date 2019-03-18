(deftemplate Letter (slot c) (slot p))

(assert (Letter (c D) (p 1)))
(assert (Letter (c A) (p 2)))
(assert (Letter (c C) (p 3)))
(assert (Letter (c A) (p 4)))


(defrule rule-1 "Enumerate all the letters"
    (Letter (c ?l1)) (Letter (c ?l2)) (Letter (c ?l3)) (Letter (c ?l4))
=>
   (printout t "Rule#1")
   (printout t ?l1 ?l2 ?l3 ?l4 " ")
   
)

(defrule rule-2 "Enumerate pairs of unique letters"
    (Letter (c ?l1)) (Letter (c ?l2 &~?l1))
=>
   (printout t "Rule#2")
   (printout t ?l1 ?l2 " ")
)
