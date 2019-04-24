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
(defrule onLandRule
   (need-onLand ?)
   =>
   (bind ?*MAX_LETTERS* (+ ?*MAX_LETTERS* 1))
   (print "Question ")
   (print "#")
   (print ?*MAX_LETTERS*)
   (print ": ")
   (bind ?answer (ask "Does it live on land?"))
   (assert (onLand (getFirst ?answer)))
)

(do-backward-chaining fish)
(defrule fishRule
  (need-fish ?)
  (onLand n)
  =>
  (bind ?answer (ask "Is it a fish?"))
  (assert (fish (getFirst ?answer)))
)

(do-backward-chaining mammal)
(defrule mammalRule
  (need-mammal ?)
  (onLand n)
  (fish n)
  =>
  (bind ?answer (ask "Is it a mammal?"))
  (assert (mammal (getFirst ?answer)))
)

(do-backward-chaining reptile)
(defrule reptileRule
  (need-reptile ?)
  (onLand n)
  (fish n)
  (mammal n)
  =>
  (bind ?answer (ask "Is it a reptile?"))
  (assert (reptile (getFirst ?answer)))
)

(do-backward-chaining mollusk)
(defrule molluskReptile
  (need-mollusk ?)
  (onLand n)
  (fish n)
  (mammal n)
  (reptile n)
  =>
  (bind ?answer (ask "Is it a mollusk?"))
  (assert (mollusk (getFirst ?answer)))
)

(defrule giveUp
  (onLand n)
  (fish n)
  (mammal n)
  (reptile n)
  =>
  (println "I give up!")
  (halt)
)

(do-backward-chaining harmful)
(defrule harmfulRule
  (need-harmful ?)
  (onLand n)
  (fish y)
  =>
  (bind ?answer (ask "Is it harmful to humans?"))
  (assert (harmful (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  (onLand n)
  (fish y)
  (harmful n)
  =>
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule harmfulRule
  (need-nemo ?)
  (onLand n)
  (fish y)
  (harmful n)
  (big n)
  =>
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)


(do-backward-chaining orangeCooked)
(defrule harmfulRule
  (need-orangeCooked ?)
  (onLand n)
  (fish y)
  (harmful n)
  (big n)
  (nemo n)
  =>
  (bind ?answer (ask "Is it orange when cooked?"))
  (assert (orangeCooked (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  (onLand n)
  (fish y)
  (harmful y)
  =>
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule nemoRule
  (need-nemo ?)
  (onLand n)
  (fish y)
  (harmful y)
  (big n)
  =>
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)

(do-backward-chaining sharpTeeth)
(defrule sharpTeethRule
  (need-sharpTeeth ?)
  (onLand n)
  (fish y)
  (harmful y)
  (big n)
  (nemo n)
  =>
  (bind ?answer (ask "Does it have sharp teeth?"))
  (assert (sharpTeeth (getFirst ?answer)))
)

(do-backward-chaining electric)
(defrule electricRule
  (need-sharpTeeth ?)
  (onLand n)
  (fish y)
  (harmful y)
  (big n)
  (nemo n)
  (sharpTeeth y)
  (electric y)
  =>
  (bind ?answer (ask "Is it electric?"))
  (assert (electric (getFirst ?answer)))
)

(do-backward-chaining tusks)
(defrule tuskRule
  (need-tusk ?)
  (onLand n)
  (fish n)
  (mammal y)
  =>
  (bind ?answer (ask "Does it have tusks?"))
  (assert (tusks (getFirst ?answer)))
)

(do-backward-chaining horn)
(defrule hornRule
  (need-horn ?)
  (onLand n)
  (fish n)
  (mammal y)
  (tusks n)
  =>
  (bind ?answer (ask "Does it have a horn?"))
  (assert (horn (getFirst ?answer)))
)

(do-backward-chaining tusks)
(defrule tuskRule
  (need-tusk ?)
  (onLand n)
  (fish n)
  (mammal y)
  (tusks n)
  (horn n)
  =>
  (bind ?answer (ask "Does it have tusks?"))
  (assert (tusks (getFirst ?answer)))
)
