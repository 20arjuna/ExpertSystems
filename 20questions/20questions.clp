/*
** Created: April 9, 2019
** Last Modified: May 1, 2019
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

(batch ExpertSystems/toolbox.clp)

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

(deffunction printQuestionNum ()
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
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
   (printQuestionNum)
   (bind ?answer (ask "Does it live on land?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))
   )
  (assert (onLand (getFirst ?answer)))
)

(defrule fishRule "Asks if animal is a fish"
   (need-fish ?)
   =>
   (printQuestionNum)
   (bind ?answer (ask "Is it a fish?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (fish (getFirst ?answer)))
)

(defrule mammalRule "Asks if animal is a mammal"
   (need-mammal ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a mammal?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (mammal (getFirst ?answer)))
)

(defrule reptileRule "Asks if animal is a reptile"
   (need-reptile ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a reptile?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
  (assert (reptile (getFirst ?answer)))
)

(defrule molluskReptile "Asks if animal is a mollusk"
   (need-mollusk ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a mollusk?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
  (assert (mollusk (getFirst ?answer)))
)

(defrule harmfulRule "Asks if animal is harmful"
   (need-harmful ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it harmful to humans?"))
   (while (notEqual(validate ?answer) TRUE) do
       (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
  (assert (harmful (getFirst ?answer)))
)

(defrule bigRule "Asks if animal is bigger than human"
   (need-big ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it bigger than a human?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
  (assert (big (getFirst ?answer)))
)

(defrule nemoRule "Asks if animal is in the movie Finding Nemo"
   (need-nemo ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (nemo (getFirst ?answer)))
)

(defrule orangeRule "Asks if animal is orange"
   (need-orange ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it orange?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (orange (getFirst ?answer)))
)

(defrule orangeCookedRule "Asks if animal is orange when cooked"
   (need-orangeCooked ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it orange when cooked?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (orangeCooked (getFirst ?answer)))
)

(defrule sharpTeethRule "Asks if animal has sharp teeth"
   (need-sharpTeeth ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have sharp teeth?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (sharpTeeth (getFirst ?answer)))
)

(defrule electricRule "Asks if animal is electric"
   (need-electric ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it electric?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (electric (getFirst ?answer)))
)

(defrule lightRule "Asks if animal has light attached"
   (need-light ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a light attached to it?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (light (getFirst ?answer)))
)


(defrule hornRule "Asks if animal has a horn"
   (need-horn ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a horn?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (horn (getFirst ?answer)))
)

(defrule finRule "Asks if animal has a fin"
   (need-fin ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a fin?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (fin (getFirst ?answer)))
)

(defrule dangerReptileRule "Asks is dangerous"
   (need-dangerReptile ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it dangerous to humans?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (dangerReptile (getFirst ?answer)))
)

(defrule vShapedRule "Asks if animal has a vshaped snout"
   (need-vShaped ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a v-shaped snout?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (vShaped (getFirst ?answer)))
)

(defrule tentaclesRule "Asks if animal has tentacles"
   (need-tentacles ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have tentacles?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (tentacles (getFirst ?answer)))
)

(defrule triangleHeadRule "Asks if animal has a triangular head"
   (need-triangleHead ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a triangular head?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (triangleHead (getFirst ?answer)))
)

(defrule domesticatedRule "Asks if animal is domesticated"
   (need-domesticated ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Has it been domesticated?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (domesticated (getFirst ?answer)))
)

(defrule rideRule "Asks if animal can be ridden"
   (need-ride ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Can you ride it?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (ride (getFirst ?answer)))
)

(defrule northAmericaRule "Asks if animal is found in north america"
   (need-NorthAmerica ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Can it be found in North America?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (NorthAmerica (getFirst ?answer)))
)

(defrule southAmericaRule "Asks if animal is found in south america"
   (need-SouthAmerica ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Can it be found in South America?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (SouthAmerica (getFirst ?answer)))
)

(defrule petRule "Asks if animal can be a pet"
   (need-pet ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a common household pet?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (pet (getFirst ?answer)))
)

(defrule pinkRule  "Asks if animal is pink"
   (need-pink ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it pink?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (pink (getFirst ?answer)))
)

(defrule africaRule  "Asks if animal is african"
   (need-Africa ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Can it be found in Africa?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (Africa (getFirst ?answer)))
)

(defrule catRule  "Asks if animal is a wild cat"
   (need-cat ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a cat of some kind?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (cat (getFirst ?answer)))
)

(defrule arcticRule  "Asks if animal lives in arctic"
   (need-arctic ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it live in the arctic or antartica?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (arctic (getFirst ?answer)))
)

(defrule stripesRule  "Asks if animal has stripes"
   (need-stripes ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have stripes?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (stripes (getFirst ?answer)))
)

(defrule whitefurRule  "Asks if animal has white fur"
   (need-whitefur ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have whitefur?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (whitefur (getFirst ?answer)))
)

(defrule bearRule  "Asks if animal is a bear of some kind"
   (need-bear ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a bear of some kind?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (bear (getFirst ?answer)))
)

(defrule longneckRule  "Asks if animal has a long neck"
   (need-longneck ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a long neck?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (longneck (getFirst ?answer)))
)

(defrule maineRule  "Asks if animal has a maine"
   (need-maine ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a maine?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (maine (getFirst ?answer)))
)

(defrule primateRule  "Asks if animal is a primate"
   (need-primate ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a primate?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (primate (getFirst ?answer)))
)

(defrule speedRule "Asks if animal is known for its speed"
   (need-speed ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is known for its speed?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (speed (getFirst ?answer)))
)

(defrule jaguarRule "Asks if animal is a jaguar"
   (need-jaguar ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a jaguar?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (jaguar (getFirst ?answer)))
)

(defrule bigEarsRule "Asks if animal has big ears"
   (need-bigEars ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have big ears?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (bigEars (getFirst ?answer)))
)

(defrule changeColorRule "Asks if animal can change color"
   (need-changecolor ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it change color?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (changecolor (getFirst ?answer)))
)

(defrule shellRule "Asks if animal has a shell"
   (need-shell ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it have a shell?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (shell (getFirst ?answer)))
)

(defrule birdRule "Asks if animal is a bird"
   (need-bird ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it a bird of some kind?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (bird (getFirst ?answer)))
)


(defrule flyRule "Asks if animal can fly"
   (need-fly ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Does it fly?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (fly (getFirst ?answer)))
)

(defrule blueRule "Asks if animal is blue"
   (need-cat ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it blue?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (blue (getFirst ?answer)))
)

(defrule redRule "Asks if animal is red"
   (need-red ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it red?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

   )
   (assert (red (getFirst ?answer)))
)

(defrule nationalBirdRule "Asks if animal is the US national bird"
   (need-nationalBird ?)
   =>
   (printQuestionNum)




   (bind ?answer (ask "Is it the US National Bird?"))
   (while (notEqual(validate ?answer) TRUE) do
      (bind ?answer (ask "Invalid input! Enter input which either starts with 'y' or 'n': "))

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
   (assert (solved y))
   (printout t "It's a salmon!" crlf)
)

(defrule tuna
   (onLand n)
   (fish y)
   (harmful n)

   (nemo n)
   (orangeCooked n)
=>
   (assert (solved y))
   (printout t "It's a tuna!" crlf)
)

(defrule BlueTang
   (onLand n)
   (fish y)
   (harmful n)

   (nemo y)
   (orange n)
=>
   (assert (solved y))
   (printout t "It's a Blue Tang!" crlf)
)

(defrule Clownfish
   (onLand n)
   (fish y)
   (harmful n)

   (nemo y)
   (orange y)
=>
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
   (printout t "It's a baracuda!" crlf)
)

(defrule Shark
   (onLand n)
   (fish y)
   (harmful y)
   (big y)
=>
   (assert (solved y))
   (printout t "It's a shark!" crlf)
)


(defrule Narwal
   (onLand n)
   (fish n)
   (mammal y)
   (horn y)
=>
   (assert (solved y))
   (printout t "It's a narwal!" crlf)
)

(defrule Whale
   (onLand n)
   (fish n)
   (mammal y)
   (horn n)
   (fin n)
=>
   (assert (solved y))
   (printout t "It's a whale!" crlf)
)

(defrule Dolphin
   (onLand n)
   (fish n)
   (mammal y)
   (horn n)
   (fin y)
=>
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
   (printout t "It's a squid!" crlf)
)

(defrule Horse
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride y)
   (NorthAmerica y)
=>
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
   (printout t "It's a camel!" crlf)
)

(defrule Ox
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn y)
=>
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
   (printout t "It's a tortoise!" crlf)
)

(defrule Chameleon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor y)
=>
   (assert (solved y))
   (printout t "It's a chameleon!" crlf)
)

(defrule Chameleon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor y)
=>
   (assert (solved y))
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
   (assert (solved y))
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
   (assert (solved y))
   (printout t "It's a falcon!" crlf)
)

(defrule Ostrich
   (onLand y)
   (mammal n)
   (reptile y)
   (bird y)
   (fly n)
=>
   (assert (solved y))
   (printout t "It's an ostrich!" crlf)
)
(defrule alldone "Concludes the game after a guess has been made."
   (declare (salience 100))
   (solved y)
=>
   (printline "Thanks for playing! Enter (play) to play again.")
)

(defrule giveup
   (declare (salience -100))
   (not(solved y))
=>
   (printline "I give up! Enter (play) to play again.")
)
