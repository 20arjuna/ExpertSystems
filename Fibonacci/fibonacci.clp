/*
** Created: January 27, 2019
** Last Modified: January 30, 2019
** 
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson 
**
** The factorial file provides functions to
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

(batch ExpertSystems/utilities.clp) 

(deffunction fibo (?n)

   (bind ?num1 1)
   (bind ?num2 1)
   (bind ?answer (create$))

   (for (bind ?i 0) (< ?i ?n) (++ ?i)
      (bind ?answer (appendToList ?answer ?num1))
      (bind ?sumOfPrevTwo (+ ?num1 ?num2))
      (bind ?num1 ?num2)
      (bind ?num2 ?sumOfPrevTwo)
   )
   (return ?answer)
)

(deffunction appendToList (?list ?val)
   (return (insert$ ?list (+(length$ ?list) 1) ?val))
)

(deffunction isValid (?input)
   return(and (isNumber ?input) (isNonNegativeNumber ?input))
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
(deffunction fibonacci (?n)
   (if(not (isValid ?n)) then
      (bind ?answer FALSE)
   else 
      (bind ?answer (fibo ?n))
   )
   (return ?answer)
)
(deffunction fib (?n)
   (if (= (isValid ?n) FALSE) then
      (bind ?answer "Enter valid input! Only non-negative numbers are allowed!")
   else
      (bind ?answer (fibonacci ?n))
   )
   (return ?answer)
)
      
/*
** Driver function for the factorial operation. Presents the user with an interactive
** user interface while taking in a value to calculate the factorial for. The function
** weeds out bad input (values which are either not numbers or nonnegative numbers) to
** ensure that the program can accept any value from the user without crashing.
**
** Returns: void
*/
(deffunction runFibo () 
   (printline "")

   (printline "************************")
   (printline "Fibonacci Numbers Generator")
   (printline "************************")

   (printline "Please only input non negative numbers. Floating point numbers will be truncated.") 
   (printline (fib (ask "How many fibonacci numbers would you like to generate: ")))
   (return)
)    
       