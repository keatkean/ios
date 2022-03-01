// Part 4 - Arrays and Collections
//
// Initialize an array of integers
//
var primeNumbers = [1, 2, 3, 5, 7, 11, 13, 17, 19]

// Get the first prime number
//
print ("The first prime number is \(primeNumbers[0])")

// Gets the total number of items in the primeNumbers array.
//
print ("The number of items in the array is: \(primeNumbers.count)")

// Sum all prime numbers
//
var sum = 0
for i in 0 ... primeNumbers.count - 1
{
    sum = sum + primeNumbers[i];
}
print ("Sum of primeNumbers = \(sum)")

// Add a new prime number to the end of the list and print the whole list out
//
primeNumbers.append(23)
print (primeNumbers)

// Remove the 5th item from the list and print the whole list out
//
primeNumbers.remove(at: 4)      // index 4 is the 5th item
print (primeNumbers)

// Remove the number 17 from the list and print the whole list out
//
var indexOf17 = primeNumbers.firstIndex(of: 17)
if indexOf17 != nil
{
    primeNumbers.remove(at: indexOf17!)
    print (primeNumbers)
}
