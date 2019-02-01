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
** and then add another subfolder titled "Fibonacci". Insert this file,
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
**               The following functions are provided in the "utilities.clp" file 
**               in the ExpertSystems subfolder in the Jess71p1 directory.                       **
** print       - prints any argument
** printline   - print followed by a newline
** ask         - prompt the user and read back a token
** askline     - prompt the user and read back a line of text (a string)
** askQuestion - adds a question mark to the prompt used in ask
** 
*/

; Loads the "utilities.clp" file and confirms that the factorial file has been loaded.
; Also informs the user how to start the program.

(batch ExpertSystems/utilities.clp) 
(printline "")                      
(printline "fibonacci.clp loaded!") 
(printline "Type (runFibo) with parentheses in the next Jess prompt to run the factorial program.")

/*
** Function that computes a given number of fibonacci numbers. Alerts the user if bad
** input is received. 
** Bad input is defined as input which is either not a number,
** a number which is negative, or a number which is not an integer.
**
** Precondition: The number provided by the user must be a non negative integer, 
**  	  	 meaning that it must be greater than or equal to 0.
** Argument:     A number provided by the user.
** Returns:      A user-given number of fibonacci numbers
*/

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
   (return (insert$ ?list (+(length$ ?list) 1) ?val))
)

/*
** Calls the isNumber and isNonNegativeNumber functions to
** check if a given value is both a number and non negative.
**
** Argument: A given input token
** Returns:  TRUE if the given input is valid; otherwise,
**           FALSE
*/
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

/*
** Checks whether a given input is valid, meaning that it is
** both a number and non negative. If the input is not valid
** the function returns false. If the input is valid, the function
** calls upon the fibo function and returns the given number of 
** fibonacci numbers.
**
** Argument: A token provided by the user
** Returns:  A given number of fibonacci number if the input is valid; otherwise,
**           FALSE
*/
(deffunction fibonacci (?n)
   (if (not (isValid ?n)) then
      (bind ?answer FALSE)
   else 
      (bind ?answer (fibo ?n))
   )
   (return ?answer)
)

/*
** A function which is one level higher than the fibonacci function. 
** The fib function returns a string prompting the user for valid input
** if the input is not valid. The function also rounds
** the value to handle decimal values. If the valid is true, the function returns
** the given number of fibonacci numbers.
**
** Argument: A token provided by the user
** Returns:  The first given number of fibonacci numbers if the input is valid; otherwise,
**           the function returns a string prompting the user for valid input.
*/
(deffunction fib (?n)
   (if (= (isValid ?n) FALSE) then
      (bind ?answer "Enter valid input! Only non-negative numbers are allowed!")
   else
      (bind ?n (round ?n))
      (bind ?answer (fibonacci ?n))
   )
   (return ?answer)
)
      
/*
** Driver function for the fibonacci operation. Presents the user with an interactive
** user interface while taking in the number of fibonacci numbers to be printed. The function
** weeds out bad input (values which are either not numbers or nonnegative numbers) to
** ensure that the program can accept any value from the user without crashing.
**
** Returns: void
*/
(deffunction runFibo () 
   (printline "")

   (printline "***************************")
   (printline "Fibonacci Numbers Generator")
   (printline "***************************")

   (printline "Please only input non negative numbers.") 
   (printline "Floating point numbers will be rounded.")
   (printline (fib (ask "How many fibonacci numbers would you like to generate: ")))
   (return)
)    
       