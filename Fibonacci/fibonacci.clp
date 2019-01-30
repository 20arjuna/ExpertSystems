/*
** Created: January 27, 2019
** Last Modified: January 30, 2019
** 
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson 
**
** The factorial class provides functions to
** calculate and report the value of the factorial
** of a user generated number while detecting wrong
** input and reporting it to the user. In order to
** run the file, create a separate folder called "ExpertSystems"
** and then add another subfolder titled "Factorial". Insert this file,
** in the "Factorial" subfolder.                         
** To run this file, open up a Jess prompt 
** and type (batch ExpertSystems/Factorial/factorial.clp) with parentheses. 
** Type (run) to start the program, also with parentheses. 
**
**               Functions included in this file
** 
** fact        - returns the factorial of a given value
**	       - checks for bad data from the user and 
**	       - reports it back to the user
** isNumber    - checks wether or not a given value is a number
** isNonNegative - checks whether or not a given value is non-negative
** factorial   - calls on the fact function to calculate the factorial
**             - of a given value (assuming it is a non-negative number)
**	       - if this is not the case, the function alerts the user that
**	       - they passed in bad input to the function
** run	       - manages and executes the 4 functions above by calling them
**             - in order, effectively driving the execution of this file.
**
**               The following functions are provided in the "utilities.clp" file 
**               in the ExpertSystems subfolder in the Jess71p1 directory.                       **
** print       - prints any argument
** printline   - print followed by a newline
** ask         - prompt the user and read back a token
** askline     - prompt the user and read back a line of text (a string)
** askQuestion - adds a question mark to the prompt used in ask
** 
*/

(deffunction fibo (?n)

   (bind ?num1 1)
   (bind ?num2 1)
   (bind ?answer (create$)

   (for (bind ?i 0) (<= ?i ?n) (++ ?i)
      (bind ?answer (appendToList ?answer ?num1)
      
      (bind 
)

(deffunction appendToList (?list ?val)
   (return ($insert ?list ($length ?list) ?val))
)
      
      
       