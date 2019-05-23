(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*websiteName* = "")
(defglobal ?*external-class* = 0)

(deffunction play ()
   (getInput)
   (reset)
   (run)
   (return)
)

(deffunction getInput ()
   (bind ?*websiteName* (ask "Enter a website name: "))
   (return ?*websiteName*)
)

(deffunction initialize ()
      (bind ?*external-class* (new csvTest))
      (return)
)

(deffunction createPropertiesList (?sitename)
   (bind ?propertiesList (?*external-class* getProperties ?sitename))
   
)
