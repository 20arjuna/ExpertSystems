(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*external-class* = 0)

(deffunction play ()
   (bind ?sitename (getInput))
   (initialize)
   (bind ?propertiesList (createPropertiesList ?sitename))
   (printout t ?propertiesList crlf)

   (bind ?count 1)

   (bind ?rawProperties (create$ "User online Activities" "Contact" "Unspecified Data"
                                 "Cookies and Tracking Elements" "Health" "Demographic"
                                 "IP Address" "Computer Information" "Financial" "User Profile"
                                 "Location" "Opt-out Via contacting" "Opt-out via service" "Opt-in"))

   (while (< ?count 14)
      (assert(fact (nth$ ?count ?rawProperties) (nth$ ?count ?propertiesList)))
      (++ ?count)
   )
   (run)
   (return)
)

(deffunction getInput ()
   (return (ask "Enter a website name: "))
)

(deffunction initialize ()
      (bind ?*external-class* (new csvTest))
      (return)
)

(deffunction createPropertiesList (?site)
   (return (?*external-class* getProperties ?site))
)
