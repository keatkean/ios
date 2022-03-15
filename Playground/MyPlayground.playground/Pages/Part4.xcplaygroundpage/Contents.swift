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
    sum = sum + primeNumbers[i]
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

print()
// --------------------------------------------------------
// Initialize an array of strings and print the first and last item.
//
var bigNames = ["Audi", "Bentlet", "Chevrolet"]
print ("First big name: \(bigNames.first!)")
print ("Last big name: \(bigNames.last!)")

// Print all the names in reverse order, each name appearing one
// line after another
//
for name in bigNames.reversed()
{
    print (name)
}

// Remove the first and last items and print the list out
//
bigNames.removeFirst()
bigNames.removeLast()
print (bigNames)

// Dealing with multi-dimensional arrays
//
var grid =
    [
        ["3", "2", "1"], // grid[0]
        ["6", "5", "4"], // grid[1]
        ["9", "8", "7"], // grid[2]
    ]

// Print the content at [0][0]. Try to change the values
// in the square brackets to see the output.
//
print (grid[0][0])

print()
// --------------------------------------------------------
// Declare an associative array (dictionary) of
// string : string pair.
var stocks : [String: String] =
    ["YHOO": "Yahoo! Inc.",
     "CSCO" : "Cisco Systems, Inc."]

// Adds more stock codes
//
stocks["GOOG"] = "Google Inc."
stocks["AAPL"] = "Apple Inc."
stocks["MSFT"] = "Microsoft Corporation"

// Remove stock codes
stocks.removeValue(forKey: "YHOO")

print ("There are \(stocks.count) stocks")
for (stockCode, company) in stocks
{
    print ("Stock Code: \(stockCode), Company: \(company)")
}

