### .superclass and .ancestors methods on all objects:
## The class hierarchy. All Ruby objects inherit from BasicObject class
p 5.class # Fixnum
p 5.class.superclass  # Integer
p 5.class.superclass.superclass # Numeric
p 5.class.superclass.superclass.superclass # Object
p 5.class.superclass.superclass.superclass.superclass # BasicObject
p 5.class.ancestors # [Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]

puts

p 5.14.class # Float
p 5.14.class.superclass  # Numeric
p 5.14.class.superclass.superclass # Object
p 5.14.class.superclass.superclass.superclass # BasicObject
p 5.14.class.ancestors # [Float, Numeric, Comparable, Object, Kernel, BasicObject]

puts

p Hash.new(0).class # Hash
p Hash.new(0).class.superclass  # Object
p Hash.new(0).class.superclass.superclass  # BasicObject

puts

p [1, 2, 3].class # Array
p [1, 2, 3].class.superclass # Object
p [1, 2, 3].class.superclass.superclass # BasicObject


### .methods method. Available on all Ruby objects.
## Provides list of all methods on an object:
# puts 5.methods.sort # prints all of methods on Fixnum (Integer) class
puts
# puts 3.14.methods.sort
puts 5.methods - 3.14.methods # methods that Integer has but not Float class
p (5.methods - 3.14.methods).length # 22 of them
p (5.32.methods - 3.methods).length # Just 5 are on Flot that are not on Integer
