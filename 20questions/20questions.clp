/*
** Created: March 20, 2019
** Last Modified: April 24, 2019
**
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson
**
** The 20questions file plays the game think of an animal by asking
** the user to think of an animal and asking it questions to try and
** guess the user's animal. Because of this knowledge base, the Expert System
** will ask between 3 and 8 questions before guessing a correct answer or
** giving up. The Expert System uses backward chaining to define the rule the
** Expert System uses to ask questions to the user. The code is split into 2 parts,
** the backward chained question rules which define the different questions the
** Expert System asks, and the forward-chained rules which use the asserted facts
** to guess the animal. In order to execute this program,
** create a separate folder called "ExpertSystems"
** and then add another subfolder titled "20questions". Insert this file,
** in the "20questions" subfolder. To load this file, open up a Jess prompt
** and type (batch ExpertSystems/20questions/20questions.clp) with parentheses.
** Type (play) to start the program, also with parentheses. To play again after
** the program terminates, retype (play) with parentheses.
*/

(clear)
(reset)

(batch 20questions/toolbox.clp)

(defglobal ?*questionNum* = 0) ;global variable used to find which numbered question is being answered



/*
** Checks to see if the user's input is valid. Valid input is defined as
** a string which starts with either y to signal yes, and n to signal no.
** The algorithm first checks if the input is a number or not. Then it checks
** to see if the first letter of the user's input matches either y or n.
** If it does, the function returns true. If not, it returns false.
**
** Argument: ?n   The input token being validated
** Returns:       True if the token is valid; otherwise,
**                False
*/
(deffunction validate (?n)
   (if (numberp ?n) then
     (bind ?answer FALSE)

   elif (and(notEqual (str-compare (lowcase (sub-string 1 1 ?n)) y ) 0)
           (notEqual (str-compare (lowcase (sub-string 1 1 ?n)) n ) 0)) then

     (bind ?answer FALSE)
   else
     (bind ?answer TRUE)
   )
   (return ?answer)
)

/*
** This function serves as the driver function for the 20questions file.
** This is the function a user calls to start the game and it prints out
** relevant instructions/information about the program and also uses the
** (reset) function to remove all facts from working memory and the (run)
** function to run the rule engine.
**
*/
(deffunction play ()
  (printline "**** Think of an animal game ****")
  (printline "Think of an animal and answer the following questions!")
  (printline "Only respond in words starting 'y' for yes and 'n' for no.")
  (printline "All other input will close the program.")
  (printline "The program will use no more than 8 attempts to guess the animal.")
  (reset)
  (run)
  (return)
)


/*
** The following rules all fallow the same algorithm. All are backward-chained for an
** attribute, such as white fur or sharp teeth. Each rule first prints the question
** number it is asking using the ?*questionNum* global variable defined above. The rules
** then prompt the user with a question and check to see if the user's input is valid.
** A valid input starts with the letter y for yes or n for no. If the input is invalid,
** the program alerts the user and exits the game. Else, it asserts the fact with the
** attribute being backward chained and pairs it with a pattern represented by the user's
** input. Ex: If the attribute is pink-skin, the rule will assert a fact (pink-skin y)
** or (pink-skin n) depending on the user's input. Specific details about each rule
** are provided in the (defrule) construct.
*/

;Sets up backward chaining of the question rules. Further description
;for each of the instnces below are provided in the below question rules.

(do-backward-chaining onLand)                       ;establishes backward chaining for the onLand question
(do-backward-chaining fish)                         ;establishes backward chaining for the fish question
(do-backward-chaining mammal)                       ;establishes backward chaining for the mammal question
(do-backward-chaining reptile)                      ;establishes backward chaining for the repitle question
(do-backward-chaining mollusk)                      ;establishes backward chaining for the mollusk question
(do-backward-chaining harmful)                      ;establishes backward chaining for the harmful question
(do-backward-chaining big)                          ;establishes backward chaining for the big question
(do-backward-chaining nemo)                         ;establishes backward chaining for the nemo question
(do-backward-chaining orange)                       ;establishes backward chaining for the orange question
(do-backward-chaining orangeCooked)                 ;establishes backward chaining for the orangecooked question
(do-backward-chaining sharpTeeth)                   ;establishes backward chaining for the sharpTeeth question
(do-backward-chaining electric)                     ;establishes backward chaining for the electric question
(do-backward-chaining light)                        ;establishes backward chaining for the light question
(do-backward-chaining horn)                         ;establishes backward chaining for the horn question
(do-backward-chaining fin)                          ;establishes backward chaining for the fin question
(do-backward-chaining dangerReptile)                ;establishes backward chaining for the dangerReptile question
(do-backward-chaining vShaped)                      ;establishes backward chaining for the vShaped question
(do-backward-chaining tentacles)                    ;establishes backward chaining for the tentacles question
(do-backward-chaining triangleHead)                 ;establishes backward chaining for the triangleHead question
(do-backward-chaining domesticated)                 ;establishes backward chaining for the domesticated question
(do-backward-chaining ride)                         ;establishes backward chaining for the ride question
(do-backward-chaining NorthAmerica)                 ;establishes backward chaining for the NorthAmerica question
(do-backward-chaining SouthAmerica)                 ;establishes backward chaining for the SouthAmerica question
(do-backward-chaining pet)                          ;establishes backward chaining for the pet question
(do-backward-chaining pink)                         ;establishes backward chaining for the pink question
(do-backward-chaining Africa)                       ;establishes backward chaining for the Africa question
(do-backward-chaining cat)                          ;establishes backward chaining for the cat question
(do-backward-chaining arctic)                       ;establishes backward chaining for the arctic question
(do-backward-chaining stripes)                      ;establishes backward chaining for the stripes question
(do-backward-chaining whitefur)                     ;establishes backward chaining for the whitefur question
(do-backward-chaining bear)                         ;establishes backward chaining for the bear question
(do-backward-chaining longneck)                     ;establishes backward chaining for the longneck question
(do-backward-chaining maine)                        ;establishes backward chaining for the maine question
(do-backward-chaining primate)                      ;establishes backward chaining for the primate question
(do-backward-chaining speed)                        ;establishes backward chaining for the speed question
(do-backward-chaining jaguar)                       ;establishes backward chaining for the jaguar question
(do-backward-chaining bigEars)                      ;establishes backward chaining for the bigEars question
(do-backward-chaining changecolor)                  ;establishes backward chaining for the changecolor question
(do-backward-chaining shell)                        ;establishes backward chaining for the shell question
(do-backward-chaining bird)                         ;establishes backward chaining for the bird question
(do-backward-chaining fly)                          ;establishes backward chaining for the fly question
(do-backward-chaining blue)                         ;establishes backward chaining for the blue question
(do-backward-chaining red)                          ;establishes backward chaining for the red question
(do-backward-chaining nationalBird)                 ;establishes backward chaining for the nationalBird question

(defrule onLandRule "Asks if animal lives on land"
   (need-onLand ?)
    =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it live on land?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
  (assert (onLand (getFirst ?answer)))
)

(defrule fishRule "Asks if animal is a fish"
   (need-fish ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a fish?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (fish (getFirst ?answer)))
)

(defrule mammalRule "Asks if animal is a mammal"
   (need-mammal ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a mammal?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (mammal (getFirst ?answer)))
)

(defrule reptileRule "Asks if animal is a reptile"
   (need-reptile ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a reptile?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
  (assert (reptile (getFirst ?answer)))
)

(defrule molluskReptile "Asks if animal is a mollusk"
   (need-mollusk ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a mollusk?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
  (assert (mollusk (getFirst ?answer)))
)

(defrule harmfulRule "Asks if animal is harmful"
   (need-harmful ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it harmful to humans?"))
   (if (notEqual(validate ?answer) TRUE) then
       (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
       (halt)
   )
  (assert (harmful (getFirst ?answer)))
)

(defrule bigRule "Asks if animal is bigger than human"
   (need-big ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it bigger than a human?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
  (assert (big (getFirst ?answer)))
)

(defrule nemoRule "Asks if animal is in the movie Finding Nemo"
   (need-nemo ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (nemo (getFirst ?answer)))
)

(defrule orangeRule "Asks if animal is orange"
   (need-orange ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it orange?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (orange (getFirst ?answer)))
)

(defrule orangeCookedRule "Asks if animal is orange when cooked"
   (need-orangeCooked ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it orange when cooked?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (orangeCooked (getFirst ?answer)))
)

(defrule sharpTeethRule "Asks if animal has sharp teeth"
   (need-sharpTeeth ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have sharp teeth?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (sharpTeeth (getFirst ?answer)))
)

(defrule electricRule "Asks if animal is electric"
   (need-electric ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it electric?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (electric (getFirst ?answer)))
)

(defrule lightRule "Asks if animal has light attached"
   (need-light ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a light attached to it?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (light (getFirst ?answer)))
)


(defrule hornRule "Asks if animal has a horn"
   (need-horn ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a horn?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (horn (getFirst ?answer)))
)

(defrule finRule "Asks if animal has a fin"
   (need-fin ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a fin?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (fin (getFirst ?answer)))
)

(defrule dangerReptileRule "Asks is dangerous"
   (need-dangerReptile ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it dangerous to humans?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (dangerReptile (getFirst ?answer)))
)

(defrule vShapedRule "Asks if animal has a vshaped snout"
   (need-vShaped ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a v-shaped snout?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (vShaped (getFirst ?answer)))
)

(defrule tentaclesRule "Asks if animal has tentacles"
   (need-tentacles ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have tentacles?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (tentacles (getFirst ?answer)))
)

(defrule triangleHeadRule "Asks if animal has a triangular head"
   (need-triangleHead ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a triangular head?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (triangleHead (getFirst ?answer)))
)

(defrule domesticatedRule "Asks if animal is domesticated"
   (need-domesticated ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Has it been domesticated?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (domesticated (getFirst ?answer)))
)

(defrule rideRule "Asks if animal can be ridden"
   (need-ride ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Can you ride it?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (ride (getFirst ?answer)))
)

(defrule northAmericaRule "Asks if animal is found in north america"
   (need-NorthAmerica ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Can it be found in North America?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (NorthAmerica (getFirst ?answer)))
)

(defrule southAmericaRule "Asks if animal is found in south america"
   (need-SouthAmerica ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Can it be found in South America?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (SouthAmerica (getFirst ?answer)))
)

(defrule petRule "Asks if animal can be a pet"
   (need-pet ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a common household pet?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (pet (getFirst ?answer)))
)

(defrule pinkRule  "Asks if animal is pink"
   (need-pink ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it pink?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (pink (getFirst ?answer)))
)

(defrule africaRule  "Asks if animal is african"
   (need-Africa ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Can it be found in Africa?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (Africa (getFirst ?answer)))
)

(defrule catRule  "Asks if animal is a wild cat"
   (need-cat ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a cat of some kind?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (cat (getFirst ?answer)))
)

(defrule arcticRule  "Asks if animal lives in arctic"
   (need-arctic ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it live in the arctic or antartica?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (arctic (getFirst ?answer)))
)

(defrule stripesRule  "Asks if animal has stripes"
   (need-stripes ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have stripes?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (stripes (getFirst ?answer)))
)

(defrule whitefurRule  "Asks if animal has white fur"
   (need-whitefur ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have whitefur?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (whitefur (getFirst ?answer)))
)

(defrule bearRule  "Asks if animal is a bear of some kind"
   (need-bear ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a bear of some kind?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (bear (getFirst ?answer)))
)

(defrule longneckRule  "Asks if animal has a long neck"
   (need-longneck ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a long neck?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (longneck (getFirst ?answer)))
)

(defrule maineRule  "Asks if animal has a maine"
   (need-maine ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a maine?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (maine (getFirst ?answer)))
)

(defrule primateRule  "Asks if animal is a primate"
   (need-primate ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a primate?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (primate (getFirst ?answer)))
)

(defrule speedRule "Asks if animal is known for its speed"
   (need-speed ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is known for its speed?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (speed (getFirst ?answer)))
)

(defrule jaguarRule "Asks if animal is a jaguar"
   (need-jaguar ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a jaguar?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (jaguar (getFirst ?answer)))
)

(defrule bigEarsRule "Asks if animal has big ears"
   (need-bigEars ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have big ears?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (bigEars (getFirst ?answer)))
)

(defrule changeColorRule "Asks if animal can change color"
   (need-changecolor ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it change color?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (changecolor (getFirst ?answer)))
)

(defrule shellRule "Asks if animal has a shell"
   (need-shell ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it have a shell?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (shell (getFirst ?answer)))
)

(defrule birdRule "Asks if animal is a bird"
   (need-bird ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it a bird of some kind?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (bird (getFirst ?answer)))
)


(defrule flyRule "Asks if animal can fly"
   (need-fly ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it fly?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (fly (getFirst ?answer)))
)

(defrule blueRule "Asks if animal is blue"
   (need-cat ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it blue?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (blue (getFirst ?answer)))
)

(defrule redRule "Asks if animal is red"
   (need-red ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it red?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (red (getFirst ?answer)))
)

(defrule nationalBirdRule "Asks if animal is the US national bird"
   (need-nationalBird ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Is it the US National Bird?"))
   (if (notEqual(validate ?answer) TRUE) then
      (printline "Invalid input! Please follow instructions! Enter (play) to restart.")
      (halt)
   )
   (assert (nationalBird (getFirst ?answer)))
)

;;;;;;;;;;;;;;;; Forward chained rules with patterns which corespond to animals in knowledge base ;;;;;;;;;;;;;;;;;;;


/*
** The following forward chained rules use the LHS to look for the asserted facts
** and then guesses the animal whose name is the name of that specific rule.
**
*/
(defrule giveUp ;Used when the user's animal falls outside the scope of the expert system's
                ;knowlege base
   (onLand n)
   (fish n)
   (mammal n)
   (reptile n)
   (mollusk n)
    =>
   (printout t "I give up!" crlf)
   (halt)
)
(defrule giveUp ;Used when the user's animal falls outside the scope of the expert system's
                ;knowlege base
   (onLand y)
   (mammal n)
   (reptile n)
    =>
   (printout t "I give up!" crlf)
   (halt)
)
(defrule salmon
   (onLand n)
   (fish y)
   (harmful n)
   (nemo n)
   (orangeCooked y)
    =>
   (printout t "It's a salmon!" crlf)
)

(defrule tuna
   (onLand n)
   (fish y)
   (harmful n)

   (nemo n)
   (orangeCooked n)
    =>
   (printout t "It's a tuna!" crlf)
)

(defrule BlueTang
   (onLand n)
   (fish y)
   (harmful n)

   (nemo y)
   (orange n)
    =>
   (printout t "It's a Blue Tang!" crlf)
)

(defrule Clownfish
   (onLand n)
   (fish y)
   (harmful n)

   (nemo y)
   (orange y)
    =>
   (printout t "It's a Clownfish!" crlf)
)

(defrule Blowfish
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo n)
   (sharpTeeth n)
    =>
   (printout t "It's a Blowfish!" crlf)
)

(defrule Piranha
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo n)
   (sharpTeeth y)
   (electric n)
    =>
   (printout t "It's a Piranha!" crlf)
)

(defrule Eel
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo n)
   (sharpTeeth y)
   (electric y)
    =>
   (printout t "It's an electric eel!" crlf)
)

(defrule Anglerfish
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo y)
   (light y)
    =>
   (printout t "It's an anglerfish!" crlf)
)

(defrule Baracuda
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo y)
   (light n)
    =>
   (printout t "It's a baracuda!" crlf)
)

(defrule Shark
   (onLand n)
   (fish y)
   (harmful y)
   (big y)
    =>
   (printout t "It's a shark!" crlf)
)


(defrule Narwal
    (onLand n)
   (fish n)
   (mammal y)
   (horn y)
    =>
   (printout t "It's a narwal!" crlf)
)

(defrule Whale
   (onLand n)
   (fish n)
   (mammal y)
   (horn n)
   (fin n)
    =>
   (printout t "It's a whale!" crlf)
)

(defrule Dolphin
   (onLand n)
   (fish n)
   (mammal y)
   (horn n)
   (fin y)
    =>
   (printout t "It's a dolphin!" crlf)
   (halt)
)

(defrule SeaTurtle
   (onLand n)
   (fish n)
   (mammal n)
   (reptile y)
   (dangerReptile n)
    =>
   (printout t "It's a sea turtle!" crlf)
)

(defrule Aligator
   (onLand n)
   (fish n)
   (mammal n)
   (reptile y)
   (dangerReptile y)
   (vShaped n)
    =>
   (printout t "It's an aligator!" crlf)
)

(defrule Crocodile
   (onLand n)
   (fish n)
   (mammal n)
   (reptile y)
   (dangerReptile y)
   (vShaped y)
    =>
   (printout t "It's a crocodile!" crlf)
)

(defrule Mussel
   (onLand n)
   (fish n)
   (mammal n)
   (reptile n)
   (mollusk y)
   (tentacles n)
    =>
   (printout t "It's a mussel!" crlf)
)

(defrule Octopus
   (onLand n)
   (fish n)
   (mammal n)
   (reptile n)
   (mollusk y)
   (tentacles y)
   (triangleHead n)
    =>
   (printout t "It's an octopus!" crlf)
)

(defrule Squid
   (onLand n)
   (fish n)
   (mammal n)
   (reptile n)
   (mollusk y)
   (tentacles y)
   (triangleHead y)
    =>
   (printout t "It's a squid!" crlf)
)

(defrule Horse
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride y)
   (NorthAmerica y)
    =>
   (printout t "It's a horse!" crlf)
)

(defrule Alpaca
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride y)
   (NorthAmerica n)
   (SouthAmerica y)
    =>
   (printout t "It's an alpaca!" crlf)
)

(defrule Camel
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride y)
   (NorthAmerica n)
   (SouthAmerica n)
    =>
   (printout t "It's a camel!" crlf)
)

(defrule Ox
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn y)
    =>
   (printout t "It's an ox!" crlf)
)

(defrule Sheep
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn n)
   (pet n)
   (pink n)
    =>
   (printout t "It's a sheep!" crlf)
)

(defrule Pig
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn n)
   (pet n)
   (pink y)
    =>
   (printout t "It's a pig!" crlf)
)

(defrule Sheep
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn n)
   (pet y)
    =>
   (printout t "It's a dog!" crlf)
)

(defrule Polarbear
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa n)
   (arctic y)
   (whitefur y)
    =>
   (printout t "It's a polar bear!" crlf)
)

(defrule wolf
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa n)
   (arctic y)
   (whitefur n)
    =>
   (printout t "It's a wolf!" crlf)
)

(defrule Bear
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa n)
   (arctic n)
   (NorthAmerica y)
    =>
   (printout t "It's a bear!" crlf)
)

(defrule Giraffe
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa y)
   (stripes n)
   (longneck y)
    =>
   (printout t "It's a giraffe!" crlf)
)

(defrule Zebra
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa y)
   (stripes y)
    =>
   (printout t "It's a zebra!" crlf)
)

(defrule Monkey
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa y)
   (stripes n)
   (longneck n)
    =>
   (printout t "It's a monkey!" crlf)
)

(defrule Panda
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa n)
   (bear y)
    =>
   (printout t "It's a panda!" crlf)
)

(defrule monkey
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa n)
   (bear n)
    =>
   (printout t "It's a monkey!" crlf)
)

(defrule Lion
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat y)
   (maine y)
    =>
   (printout t "It's a lion!" crlf)
)

(defrule Cheetah
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat y)
   (maine n)
   (speed y)
    =>
   (printout t "It's a cheetah!" crlf)
)

(defrule Jaguar
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat y)
   (maine n)
   (speed n)
    =>
   (printout t "It's a jaguar!" crlf)
)

(defrule Gorilla
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat n)
   (primate y)
    =>
   (printout t "It's a gorilla!" crlf)
)

(defrule Elephant
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat n)
   (primate n)
   (bigEars y)
    =>
   (printout t "It's an elephant!" crlf)
)

(defrule Snake
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor n)
   (shell n)
    =>
   (printout t "It's a snake!" crlf)
)

(defrule Tortoise
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor n)
   (shell y)
    =>
   (printout t "It's a tortoise!" crlf)
)

(defrule Chameleon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor y)
    =>
   (printout t "It's a chameleon!" crlf)
)

(defrule Chameleon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor y)
    =>
   (printout t "It's a chameleon!" crlf)
)

(defrule BaldEagle
   (onLand y)
   (mammal n)
   (reptile y)
   (bird y)
   (fly y)
   (nationalBird y)
    =>
   (printout t "It's a bald eagle!" crlf)
)

(defrule Falcon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird y)
   (fly y)
   (nationalBird n)
    =>
   (printout t "It's a falcon!" crlf)
)

(defrule Ostrich
   (onLand y)
   (mammal n)
   (reptile y)
   (bird y)
   (fly n)
    =>
   (printout t "It's an ostrich!" crlf)
)
