(do-backward-chaining b)
(assert (b FALSE))
(printout t "Running..." crlf)
(defrule rule-1
   (need-b ?n)
=>
   (printout t "Asserting b to true")
   (assert (b TRUE))
)

(defrule rule-2
   (a TRUE)
   (b TRUE)
=>
   (printout t "success")
)
(run)