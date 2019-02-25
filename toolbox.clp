/*
** Created: February 1, 2019
** Last Modified: February 1, 2019
**
** Author: Arjun Akkiraju
** Author: Dr. Eric R. Nelson
**
** Small collection of JESSS utilities for ATCS:Expert Systems
**
** print       - prints any argument
** printline   - print followed by a newline
** ask         - prompt the user and read back a token
** askline     - prompt the user and read back a line of text (a string)
** askQuestion - adds a question mark to the prompt used in ask
** toChar      - given an ASCII integer value, returns the ASCII character as a string
** boolp       - Test for boolean type
** xor         - Exclusive-OR for two boolean values

*/

/*
** Function that prints out a prompt (it's just a bit shorter than using (printout t "text")
*/
(deffunction print (?arg)
   (printout t ?arg)
   (return)
)

/*
** print with a new-line at the end
*/
(deffunction printline (?arg)
   (print ?arg)
   (printout t crlf)
   (return)
)

/*
** ask the user for input and return a token
*/
(deffunction ask (?arg)
   (print ?arg)
   (return (read))
)

/*
** Same as ask but returns a string of text
*/
(deffunction askline (?arg)
   (print ?arg)
   (return (readline))
)

/*
** Appends a question mark to the prompt of the ask function
*/
(deffunction askQuestion (?arg)
   (print ?arg)
   (return (ask "? "))
)

/*
** Partially checks whether a given input is valid.
** Specifically, it checks whether the input is a number or not.
**
** Argument: The user's input token.
** Returns:  TRUE if the input token is a number; otherwise,
             FALSE
*/
(deffunction isNumber (?n)
   (return (numberp ?n))
)

/*
** Partially checks whether a given input is valid.
** Specifically, it checks whether the input is a non negative number or not.
** A non negative number is a number greater than or equal to 0.
**
** Precondition: The given input is a number.
** Argument:     A number provided by the user.
** Returns:      TRUE if the number is non negative; otherwise,
**               FALSE.
*/
(deffunction isNonNegativeNumber (?n)
   (if (< ?n 0) then
       (bind ?answer FALSE)
    else
       (bind ?answer TRUE)
   )
   (return ?answer)
)
/*
** Helper function for the fibo function. This function adds a given
** value to the end of a given list and returns the list.
**
** Argument: A list
** Argument: A value
** Returns:  The given list with the given value appended to list's end
**
*/
(deffunction appendToList (?list ?val)
   (return (create$ ?list ?val))
)
/*
** This function returns the character given a number.
** The format function is just printf() in C, but unlike printout this function returns the output,
** so if you use a nil router you don't get a printout, just the return value. A thanks goes to Henry W. for finding this out.
*/
(deffunction toChar (?ascii)
   (return (format nil "%c" (integer ?ascii)))
)

/*
** Tests is the argument is a boolean, which can only take on the value of TRUE and FALSE
*/
(deffunction boolp (?x)
   (return (or (eq ?x TRUE) (eq ?x FALSE)))
)

/*
** Simple exclusive-or function
**
** Function assumes values are either TRUE or FALSE
*/
(deffunction xor (?a ?b)
   (return (and (or ?a ?b) (not (and ?a ?b))))
)
