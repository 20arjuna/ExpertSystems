/*
** Created: February 25, 2019
** Last Modified: April 9, 2019
**
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson
**
** The anagram file generates anagrams based on a word inputted by the user. All outputs
** are printed to the console on seperate files. In order to
** run the file, create a separate folder called "ExpertSystems"
** and  add another subfolder titled "Anagrams". Insert this file,
** in the "Anagrams" subfolder which has just been created.
** To run this file, open up a Jess prompt
** and type (batch ExpertSystems/Anagram/anagram.clp)
** with parentheses.
**
**                   Functions included in this file
**
** slice$          - Slices the input token into a tokenized list.
** isLessThan      - Determines if a word's length is <= to a given length.
** getInput        - Gets user's input which they want to get anagrams of.
** assertLetter    - Asserts a letter into the machine's working memory.
** assertLetterList- Iterates through a list of letters and asserts each one
**                 - using the assertLetter function.
** createRule      - Dynamically creates a rule which prints out anagrams based on
**                 - the user's input.
** runAnagram      - Driver function for entire anagram file
**
**                   The following functions are provided in the "toolbox.clp" file **********
**                   in the ExpertSystems subfolder in the Jess71p1 directory.      **********
**
** print           - prints any argument
** printline       - print followed by a newline
** ask             - prompt the user and read back a token
** askline         - prompt the user and read back a line of text (a string)
** askQuestion     - adds a question mark to the prompt used in ask
** toChar          - given an ASCII integer value, returns the ASCII character as a string
** boolp           - Test for boolean type
** xor             - Exclusive-OR for two boolean values
**
*/

(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*questionNum* = 0) ;global variable used to find which numbered question is being answered

(do-backward-chaining onLand)
(do-backward-chaining fish)
(defrule onLandRule
   (need-onLand ?)
   =>
   (bind ?answer (ask "Does it live on land?"))
   (assert (onLand (getFirst ?answer)))
)


(defrule fishRule
  (need-fish ?)
  =>
  (bind ?answer (ask "Is it a fish?"))
  (assert (fish (getFirst ?answer)))
)

(do-backward-chaining mammal)
(defrule mammalRule
  (need-mammal ?)
  =>
  (bind ?answer (ask "Is it a mammal?"))
  (assert (mammal (getFirst ?answer)))
)

(do-backward-chaining reptile)
(defrule reptileRule
  (need-reptile ?)
  =>
  (bind ?answer (ask "Is it a reptile?"))
  (assert (reptile (getFirst ?answer)))
)

(do-backward-chaining mollusk)
(defrule molluskReptile
  (need-mollusk ?)
  =>
  (bind ?answer (ask "Is it a mollusk?"))
  (assert (mollusk (getFirst ?answer)))
)

(do-backward-chaining harmful)
(defrule harmfulRule
  (need-harmful ?)
  =>
  (bind ?answer (ask "Is it harmful to humans?"))
  (assert (harmful (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  =>
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule nemoRule
  (need-nemo ?)
  =>
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)

(do-backward-chaining orange)
(defrule orangeRule
  (need-orange ?)
  =>
  (bind ?answer (ask "Is it orange?"))
  (assert (orange (getFirst ?answer)))
)

(do-backward-chaining orangeCooked)
(defrule orangeCookedRule
  (need-orangeCooked ?)
  =>
  (bind ?answer (ask "Is it orange when cooked?"))
  (assert (orangeCooked (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  =>
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule nemoRule
  (need-nemo ?)
  =>
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)

(do-backward-chaining sharpTeeth)
(defrule sharpTeethRule
  (need-sharpTeeth ?)
  =>
  (bind ?answer (ask "Does it have sharp teeth?"))
  (assert (sharpTeeth (getFirst ?answer)))
)

(do-backward-chaining electric)
(defrule electricRule
  (need-sharpTeeth ?)
  =>
  (bind ?answer (ask "Is it electric?"))
  (assert (electric (getFirst ?answer)))
)

(do-backward-chaining tusks)
(defrule tuskRule
  (need-tusk ?)
  =>
  (bind ?answer (ask "Does it have tusks?"))
  (assert (tusks (getFirst ?answer)))
)

(do-backward-chaining horn)
(defrule hornRule
  (need-horn ?)
  =>
  (bind ?answer (ask "Does it have a horn?"))
  (assert (horn (getFirst ?answer)))
)

(do-backward-chaining fin)
(defrule finRule
  (need-fin ?)
  =>
  (bind ?answer (ask "Does it have a fin?"))
  (assert (fin (getFirst ?answer)))
)

(do-backward-chaining dangerReptile)
(defrule dangerReptileRule
  (need-dangerReptile ?)
  =>
  (bind ?answer (ask "Is it dangerous to humans?"))
  (assert (dangerReptile (getFirst ?answer)))
)

(do-backward-chaining vShaped)
(defrule vShapedRule
  (need-vShaped ?)
  =>
  (bind ?answer (ask "Does it have a v-shaped snout?"))
  (assert (vShaped (getFirst ?answer)))
)

(do-backward-chaining tentacles)
(defrule tentaclesRule
  (need-tentacles ?)
  =>
  (bind ?answer (ask "Does it have tentacles?"))
  (assert (tentacles (getFirst ?answer)))
)

(do-backward-chaining triangleHead)
(defrule triangleHeadRule
  (need-triangleHead ?)
  =>
  (bind ?answer (ask "Does it have a triangular head?"))
  (assert (triangleHead (getFirst ?answer)))
)

(defrule salmon
   (onLand n)
   (fish y)
   (harmful n)
   (big n)
   (nemo n)
   (orangeCooked y)
   =>
   (printout t "It's a salmon!" crlf)
)

(defrule tuna
   (onLand n)
   (fish y)
   (harmful n)
   (big n)
   (nemo n)
   (orangeCooked n)
   =>
   (printout t "It's a tuna!" crlf)
)

(defrule BlueTang
   (onLand n)
   (fish y)
   (harmful n)
   (big n)
   (nemo y)
   (orangeCooked y)
   =>
   (printout t "It's a salmon!" crlf)
)

(deffunction play ()
   (printline "welcome to 20 qs")
   (run)
)
