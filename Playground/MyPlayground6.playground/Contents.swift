// Part 6 - Functions
//
// Declares a function. Take note of
// all the internal / external parameter
// names and the return type.
func sum(theFirst n: Int, numbersOfThisList list: [Int]) -> Int
{
    var sum = 0
    for i in 0 ... list.count - 1
    {
        if (i>=n)
        {
            break
        }
        sum += list[i]
    }
    return sum
}


// We declare a list of integers.
//
var listOfIntegers = [1, 2, 3, 4, 5, 6, 8, 10, 12, 14]

// Call the function.
// Notice the first and second parameter requires
// external parameter names?
//
print (sum(theFirst: 4, numbersOfThisList:listOfIntegers))
