// Part 7 - Classes
//
// Declares a shape class.
//
class Shape
{
    private var name : String
    
    init (withName: String)
    {
        self.name = withName
    }
    
    // This method is meant to be overriden
    // by any sub-classes.
    //
    func draw()
    {
        print ("This is a \(name)")
    }
}

// Declare a Square class that inherits the Shape
// class.
class Square : Shape
{
    private var width: Int
    
    // Initializer
    init(withWidth: Int)
    {
        self.width = withWidth
        super.init(withName: "Square")
    }
    
    // This class will implement the draw method
    // to draw itself.
    override func draw() {
        super.draw()
        var s = ""
        for _ in 0 ... width - 1
        {
            s += "*";
        }
        
        for _ in 0 ... width - 1
        {
            print (s)
        }
    }
}

// Declare a Rectangle class that inherits from the Shape class.
//
class Rectangle : Shape
{
    private var width: Int
    private var height: Int
    
    // Initializer
    init(withWidth: Int, andHeight:Int)
    {
        self.width = withWidth
        self.height = andHeight
        super.init(withName: "Rectangle")
    }
    
    // This class will implement the draw method
    // to draw itself. Look at how it is different
    // from the Square class?
    override func draw() {
        super.draw()
        var s = ""
        for _ in 0 ... width - 1
        {
            s += "*";
        }
        
        for _ in 0 ... height - 1
        {
            print (s)
        }
    }
}

// Declare an array of Shapes
//
var shapes : [Shape] = []

// Add 2 squares and rectangles
//
shapes.append(Square(withWidth: 2))
shapes.append(Square(withWidth: 3))
shapes.append(Rectangle(withWidth: 1, andHeight: 4))
shapes.append(Rectangle(withWidth: 5, andHeight: 2))

// Loop through each shape and use polymorphism
// to call their respective draw methods.
//
for shape in shapes
{
    shape.draw()
}
