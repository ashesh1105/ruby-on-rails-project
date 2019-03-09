require_relative "./modules/square"
require_relative "./modules/rectangle"
require_relative "./modules/circle"
require_relative "./modules/length_conversions"

p "Square Area: #{Square.area(15)}"
p "Rectangle Area: #{Rectangle.area(20, 10)}"
p "Circle Area: #{Circle.area(15)}"
p "WEBSITE from LengthConversions: #{LengthConversions::WEBSITE}"


### The Math Module: Built-in with Ruby
## :: is scope resolution operator, used to get constants out of modules
puts Math::PI # 3.141592653589793
# puts Math.methods # gives all the methods of Math class
puts Math.sqrt(625) # 25.0
puts Math.sin(90) # 0.8939966636005579
