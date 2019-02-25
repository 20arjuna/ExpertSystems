/*
** Created: January 30, 2019
** Last Modified: February 1, 2019
**
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson
**
** The fibonacci file provides functions to
** calculate and report a user generated number of fibonacci
** numbers while being able to detect wrong
** input (numbers which are either negative or not numbers)
** and reporting it to the user. In order to
** run the file, create a separate folder called "ExpertSystems"
** and  add another subfolder titled "Fibonacci". Insert this file,
** in the "Fibonacci" subfolder which has just been created.
** To run this file, open up a Jess prompt
** and type (batch ExpertSystems/Fibonacci/fibonacci.clp) with parentheses.
** Type (runFibo) to start the program, also with parentheses.
**
**               Functions included in this file
**
** fibo         - returns a given numbers of fibonacci numbers and
**	        - checks for bad data from the user and
**	        - reports it back to the user
** appendToList - Appends a given value to the end of a given list
** isValid      - Combines the two below methods to check if a token
**              - is a non negative number
** isNumber     - checks wether or not a given value is a number
** isNonNegative- checks whether or not a given value is non-negative
** fibonacci    - calls on the fibo function to calculate a given number
**              - of fibonacci numbers. fibonacci is one level higher than
**              - than fibo, so it verifies the input with the isValid function
**              - and returns the list of numbers if the input is valid, and returns
**              - false if the input is not valid
** fib          - fib is above both fibonacci and fibo.
**              - fib takes in an input and decides whether the input is valid
**              - or not. If it is not valid, the function will return a string prompting
**              - the user for valid input. If the input is valid, the function will
**              - return the given amount of fibonacci numbers
** runFibo      - Driver function for the entire file. This function prints to the console
**              - and prompts the user for input while warning them to input only
**              - non negative numbers. runFibo calls on the previous methods to validate
**              - the input and generate the given amount of fibonacci numbers.
**              - in order, effectively driving the execution of this file.
**
**               The following functions are provided in the "toolbox.clp" file
**               in the ExpertSystems subfolder in the Jess71p1 directory.                       **
** print       - prints any argument
** printline   - print followed by a newline
** ask         - prompt the user and read back a token
** askline     - prompt the user and read back a line of text (a string)
** askQuestion - adds a question mark to the prompt used in ask
**
*/



(batch ExpertSystems/toolbox.clp)

(deffunction slice$ (?n)
   (bind ?stringList (explode$ ?n))
   (bind ?answer (create$))
   (foreach ?string ?stringList
      (for (bind ?index 1) (<= ?index (str-length ?string)) (++ ?index)
         (bind ?answer (create$ ?answer (explode$ (sub-string ?index ?index ?string))))
      )
   )
  (return ?answer)
)

(deffunction hist (?input)
   (bind ?input (lowcase ?input))
   (bind ?newline "
   ")
   (bind ?letters (slice$ ?input))
   (bind ?ascii (create$))
   (bind ?nums (create$))

   (bind ?letterLength 26)
   (bind ?ascii_base 97)
   (for (bind ?i 1) (<= ?i ?letterLength) (++ ?i)
      (bind ?nums (create$ ?nums ?ascii_base))
      (++ ?ascii_base)
   )
   (bind ?input (slice$ ?input))
   (for (bind ?j 1) (<= ?j (-(length$ ?input) 1) (++ ?j)
      (bind ?ascii (create$ ?ascii (asc (nth$ ?j ?letters))))
   )
   (bind ?answerValue "")
   (for (bind ?i 1) (<= ?i (length$ ?nums)) (++ ?i)
      (bind ?count 0)
      (bind ?temp 0)
      (for (bind ?j 1) (<= ?j (length$ ?ascii)) (++ ?j)
         (bind ?temp (nth$ ?i ?nums))
         (if (= (str-compare (nth$ ?j ?ascii) (nth$ ?i ?nums)) 0) then
            (++ ?count)
         )
      )
      printline
      (bind ?answerValue (str-cat (toChar ?temp) " " (explode$ ?count) ?newline))
      (printline ?answerValue)
   )

   (return)

)
(deffunction runAlphHist ()
   (printline "")
   (printline "***************************")
   (printline "Run Alphabetic Histogram")
   (printline "***************************")
   (printline (hist (ask "Enter a string to analyze: ")))
)
