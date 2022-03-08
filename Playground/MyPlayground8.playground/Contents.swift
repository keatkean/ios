// Part 8 - Optionals
//
var name1: String?
var name2: String? = "Mark"

// Have a look at the output to see how optionals are printed
//
print (name1)
print (name2)

// It’s always a good practice to check for nil
// on optional variables.
//
if name1 != nil
{
// It’s always a good practice to check for nil
    //
    print ("name1 is :\(name1!)")
}
if name2 != nil
{
    print ("name2 is: \(name2!)")
}
if let unwrappedName1 = name1
{
    print ("unwrappedName1 is: \(unwrappedName1)")
}
if let unwrappedName2 = name2
{
    print ("unwrappedName2 is: \(unwrappedName2)")
}

var numerator : Double!
var denominator: Double

numerator = 4.0
denominator = 2.3

if numerator != nil
{
    let fraction = numerator / denominator
    print ("result is: \(fraction)")
}
