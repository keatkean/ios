// Part 1 - Integers
//
// Declares a new integer variable, called 'i' and sets
// its value to 1.
//
var i = 1

// Prints whatever value that was stored in 'i'.
//
print (i)

// Changes the value of 'i' so that it is incremented by 1.
//
i = i + 1

// Prints the updated value
//
print (i)

// Create some new variables.
//
var a = 12
var b = 13
var c = 10
var d = 3

// Then, execute the following formula and save the result.
// Can you explain why the result is not accurate (it doesn't
// show the decimal numbers)?
//
var result = (a * b) / (c - d)
print (result)

print()
// Part 2 - Doubles
//
// Declares two variables, one to store the radius of a circle
// another to store 'pi'. Notice we use 'let' instead of 'var',
// because we expect 'pi' to be constant throughout your program.
//
var r = 4.0         // Use 4.0 instead of 4 to declare a double
let pi = 3.141592

// Calculate the circumference of a circle whose radius is 'r'
// and print the result.
//
var circumference = 2 * pi * r
print (circumference)

// Calculate the area of a circle whose radius is 'r'
// and print the result.
//
var area = pi * r * r
print (area)

// Calculate acceleration given force, 'f', and mass 'm'.
//
var m = 10.0
var f = 25.0
var acc = f / m
print (acc)

print()
// Part 3 - Strings
//
// Declare a string variable and prints its contents
//
var s = "Hello Nanyang Polytechnic!"
print (s)

// Prints the string within another string
//
print ("The string was '\(s)'");

// Converts the whole string to uppercase and print the results.
//
var uppercasedString = s.uppercased()
print (uppercasedString)

// Converts the whole string to lowercase and print the results.
//
var lowercasedString = s.lowercased()
print (lowercasedString)

// Displaying results of computations in your string.
//
var areaResult = "The area of the circle of radius \(r) is \(area)"
print (areaResult)

// You can even do this:
//
print ("The circumference of that circle of radius \(r) will be \(circumference)")

// Prints the length of the string
//
print (uppercasedString.count)

// Gets the n-th character in a string
//
var n = 4
var index = uppercasedString.index(uppercasedString.startIndex, offsetBy: n)
print (uppercasedString[index])
