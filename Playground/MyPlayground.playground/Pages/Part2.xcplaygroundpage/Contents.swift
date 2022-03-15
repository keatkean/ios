import Foundation

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
print (String(format: "%.2f", circumference))

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
