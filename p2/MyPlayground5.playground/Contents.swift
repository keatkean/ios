// Part 4 - Arrays and Collections
//
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

// --------------------------------------------------------
// Part 5 - Control Flow
//
// If-else
//
var happy = true
if happy
{
    print ("I am happy")
}
else
{
    print ("I am not happy")
}

// Test if the airport (based on its key) exists in the
// 'airports' collection.
//
if stocks.keys.contains("GOOG") && happy
{
    print ("I will be happy to work in \(stocks["GOOG"]!)")
}

// While loop
//
var w = 10
while w > 0
{
    print (w)
    w = w - 1
}

// repeat while loop
//
repeat
{
    w = w + 1
    print (w)
}
while w < 10
