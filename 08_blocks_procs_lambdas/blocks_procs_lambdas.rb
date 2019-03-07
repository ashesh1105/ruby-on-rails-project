# A block is not an object, exeption in Ruby where everything is an object.
# A block is a set of code instructions that execute together sequentially
# Basically code between two curly braces or between do and end
# A block optionally takes arguments between pipes |arg1, arg2..|
# A block helps define how a method will operate, like .each, .map, .times or
# our own custom methods.

### .yield keyword shifts control from a method block to a custom block provided
## when method is called. If no such block was provided during method call,
# and yield is used in method block it will be an error:
def a_method
  puts "Started executing method block.."
  yield
  puts "I am now back inside method block!"
end

a_method { puts "I am inside custom block provided during method call!"}
# prints:
# Started executing method block..
# I am inside custom block provided during method call!
# I am now back inside method block!

# You can provide do - end type blocks too during method call:
a_method do
  puts "I am inside custom block provided during method call!"
  puts "Thanks to yield keyword applied inside the method! :)"
end
# prints:
# Started executing method block..
# I am inside custom block provided during method call!
# Thanks to yield keyword applied inside the method! :)
# I am now back inside method block!

# Also note that yield custom blocks implicitely return the result of block
# execution to method to which block is provided. So we should not explicitely
# try to return anything from provided method!
# Example:
def who_am_i
  adjective = yield # will call the block provided during this method call
  puts "I am #{adjective}"
end
# Now, call the method and provide our custom block that implicitely returns
# that will be assigned to "adjective" variable in method block:
who_am_i { "a good manager!" } # prints "I am a good manager!"
who_am_i { "super efficient!" }  # prints I am super efficient!
# who_am_i { return "smart" } # will cause error since return keyword used here!


### yield with block_given? check
## helps not get big red error if block is not provided while calling a method
# that has yield statements:
def a_method
  puts "Started executing method block.."
  yield if block_given?
  puts "I am now back inside method block!"
end

a_method  # will not flag error since yield statement checks for block_given?
          # in method block

### yield with parameters passed to custom blocks:
# .each Array method uses this technieque where array iteration is handled by
# a common method and custom blocks decide what to do with each array element!
# custom_each statement without using .each method on array:
puts "\ncustom_each method demo with yield with arguments:"
def custom_each(array)
  i = 0
  while i < array.length
    yield(array[i]) if block_given?
    i += 1
  end
end
# Now you can provide your custom implementation during your method call:
# prints cubes of all array elements:
custom_each([1, 2, 3, 4]) { |elem| puts elem ** 3 }
# prints each names that are part of array passed to method:
custom_each(["Ashesh", "Brett", "Yulian"]) do |name|
  puts "name: #{name}"
end
# prints length of names that are present in array passed to method
custom_each(["Shiela", "Lolitha", "Suresh"]) {|name|
  puts "#{name}.length = #{name.length}"}

puts "\n"

### Procs are objects that help keep the code DRY and helps refactoring code
a = [1, 2, 3, 4, 5]
b = [3, 7, 9]
c = [10, 11, 12, 13, 14]

# This code is not DRY. See the refactored one below commented lines
# a_squares = a.map { |num| num ** 2 }  # prints [1, 4, 9, 16, 25]
# b_squares = b.map { |num| num ** 2 }  # prints [9, 49, 81]
# c_squares = c.map { |num| num ** 2 }  # prints [100, 121, 144, 169, 196]
#
# p a_modified, b_modified, c_modified

squares = Proc.new { |num| num ** 2 }
# You can pass proc object in map method instead of giving it your own block
# each time! Just be careful to prepent & on proc name so you get object and not
# the memory address of proc!
a_squares = a.map(&squares)
b_squares = b.map(&squares)
c_squares = c.map(&squares)
p a_squares # prints [1, 4, 9, 16, 25]
p b_squares # prints [9, 49, 81]
p c_squares # prints [100, 121, 144, 169, 196]

# There's even better way of refactoring above leveraging Array unpack feature:
a_squares, b_squares, c_squares = [a, b, c].map { |array| array.map(&squares) }
p a_squares # prints [1, 4, 9, 16, 25]
p b_squares # prints [9, 49, 81]
p c_squares # prints [100, 121, 144, 169, 196]

# Apart from DRY code, this improves maintainability as well. Say, you need to
# have cubes functionality for some arrays, you write another proc and use that
# in .map method for that array:
cubes = Proc.new { |num| num ** 3 }
p b.map(&cubes) # prints [27, 343, 729]

## Another practical example of where Procs can be used:
currencies = [38, 67.17, 92, 49.32, 10]
# Define some procs for Currency Conversions:
to_euros = Proc.new { |currency| (currency * 0.95).round(2) }
to_rupees = Proc.new { |currency| (currency * 68.13).round(2) }
to_pesos = Proc.new { |currency| (currency * 20.70).round(2) }

# Don't forget & before Proc names!
p currencies.map(&to_euros) # prints [36.1, 63.81, 87.4, 46.85, 9.5]
p currencies.map(&to_rupees) # prints [2588.94, 4576.29, 6267.96, 3360.17, 681.3]
p currencies.map(&to_pesos)  # prints [786.6, 1390.42, 1904.4, 1020.92, 207.0]

## Prcs can help on operations like .select and .reject too!
# Also, you can use do - end blocks for Procs as well:
ages = [10, 66, 83, 30, 43, 70, 18, 45]
# Define a Proc to be used at .select. Remember this has to include a boolean expression!
# Ruby won't let you use ? at end of proc name, so senior_citizen? will throw error!
senior_citizen = Proc.new do |age|
  age >= 65
end
# Let's use this proc now:
seniors = ages.select(&senior_citizen)
non_seniors = ages.reject(&senior_citizen)
p seniors # prints [66, 83, 70]
p non_seniors # prints [10, 30, 43, 18, 45]


### Eevn if a method does not define parameters, if it uses yield statements,
## a Proc can be passed to it as an argument instead of custom block while
# calling that method!
def hello
  puts "Inside the method block.."
  yield if block_given?
  puts "Back inside the method block!"
end
proc1 = Proc.new { puts "Inside proc1!" }
hello(&proc1) # prints:
# Inside the method block..
# Inside proc1!
# Back inside the method block!

### Procs are like blocks and can be used whereever a block is needed but it
## is an object and does has method. You can use .call method on a proc to call
# it directly. Can't do it with a block!
proc2 = Proc.new {puts "Hello jee!"}
# You can always pass your custom block to .times method:
# 3.times {puts "Hello!"}
# How about passing a Proc?
3.times(&proc2) # prints "Hello jee!" 3 times!
proc2.call  # will also print "Hello jee!"


### Pass a Ruby built-in method a Proc!
# We know below works
str_arr = ["1", "2", "3"]
p str_arr.map { |elem| elem.to_i }  # prints numeric array [1, 2, 3]
# How about passing this to a Proc in this way?
p str_arr.map(&:to_i) # prints numberic array [1, 2, 3] !!!
# In above, you convert Array method name of to_i to a Symbol and then to a proc!
# Possibilities are enourmouns here!
p [10, 14, 15].map(&:to_s)  # prints String array: ["10", "14", "15"] !!
# Instead of this approach of .select:
p [1, 2, 3, 4, 5, 6, 7, 8].select { |elem| elem.even? } # prints [2, 4, 6, 8]
# How about this sortcut for .select?
p [1, 2, 3, 4, 5, 6, 7, 8].select(&:even?) # prints [2, 4, 6, 8] !!
# And..
p [1, 2, 3, 4, 5, 6, 7, 8].select(&:odd?) # prints [1, 3, 5, 7] !!
p [1, 2, 3, 4, 5, 6, 7, 8].reject(&:even?) # prints [1, 3, 5, 7] !!
# This shortcut syntaxt to pass Ruby methods a Proc is less error prone too, right?


### Methods with Proc Parameters:
## Procs can be defined as parameters of a method, need & to be prefixed there,
# but when we use that proc in method block to call and pass argument to it, we
# don't need to prefix it with & there:
def talk_about(name, &proc) # proc name will take & here
  proc.call(name) # you don't need & with proc names inside method block!
end

# Let's define some procs now that we can pass to above method:
good_things = Proc.new do |name|
  puts "#{name} is a great listener!"
  puts "#{name} is a super helpful!"
  puts "#{name} is a an honest person!"
end
bad_things = Proc.new do |name|
  puts "#{name} is not trust worthy."
  puts "#{name} is hard to work with."
end
# Now we can call the method and pass these procs:
talk_about("Ashesh", &good_things)  # Don't forget & with proc name here!
talk_about("XYZ", &bad_things)


### Intro to Lamdas in Ruby: they are identical, both of them come from Proc class
## Lambdas can be used whereever Proc can be used. There are two differences:
## As shown below, lambda can replace Procs and be called exactly same way as
# Procs. Lambda is more popular due to its syntaxt and common name with other
# programming languages like Python:
squares_lambda = lambda { |num| num ** 2 }
squares_proc = Proc.new { |num| num ** 2 }

p [1, 2, 3].map(&squares_proc)  # prints [1, 4, 9]
p squares_proc.call(5)  # prints 25

p [1, 2, 3].map(&squares_lambda)  # prints [1, 4, 9]
p squares_lambda.call(5)  # prints 25

# Here are two differences between Procs and Lambda:
# Difference #1) Lambda complains when more arguements passed then it is declared with:
p squares_proc.call(5, 10)  # still prints 25, Proc ignores extra args passed!
# p squares_lambda.call(5, 10)  # This will thrown an error:
# wrong number of arguments (given 2, expected 1) !!
# Programmers like this feature in lambda for it being strict on # of args to be passed.

# Difference #2) When return keyword is used in Lambda to return something to
# method that calls a Lambda, it returns the data and control to calling method,
# hence the method can return the data it needs to, but in case of Proc,
# a return statement from Proc, if called in a method, breaks from the method
# itself and whatever Proc returned, is actually returned from method itself!
# Example:
# See lambda first:
def diet
  status = lambda { return "You gave in! (from status lambda).." }
  status.call
  "You completed the diet"
end
p diet  # prints "You completed the diet"

# Now see Proc:
def diet
  status = Proc.new { return "You gave in! (from status lambda).." }
  status.call
  "You completed the diet"
end
p diet  # prints "You gave in! (from status lambda).."
# So it is obvious that Proc is less efficient here! We need the control to come
# back to method that defines / calls a Proc or Lambda and method should have the
# freedom to decide what to return to the caller of the method, right?


### Make code shorter and simpler with Lambdas:
## See the code below:
def convert_to_euros(dollars)
  if dollars.is_a?(Numeric)
    dollars * 0.95
  end
end

def convert_to_pesos(dollars)
  if dollars.is_a?(Numeric)
    dollars * 20.67
  end
end

def convert_to_rupees(dollars)
  if dollars.is_a?(Numeric)
    dollars * 68.13
  end
end

p convert_to_euros(1000)  # prints 950.0
p convert_to_pesos(1000)  # prints 20670.0
p convert_to_rupees(1000) # prints 68130.0

# Too many lines above, right? First level of refactoring can be to do inline ifs:
def convert_to_euros(dollars)
  dollars * 0.95 if dollars.is_a?(Numeric)
end

def convert_to_pesos(dollars)
  dollars * 20.67 if dollars.is_a?(Numeric)
end

def convert_to_rupees(dollars)
  dollars * 68.13 if dollars.is_a?(Numeric)
end

# Next, other than conversion rate, nothing is different there, right?
# We create a common method with yield statement and pass a block while calling
# that method:
def convert(dollars, currency)
  yield(dollars, currency) if dollars.is_a?(Numeric)
end
p convert(1000, "euros") {|dollars| dollars * 0.95 }    # prints 950.0
p convert(1000, "pesos") {|dollars| dollars * 20.67 }   # prints 20670.0
p convert(1000, "rupees") {|dollars| dollars * 68.13 }  # prints 68130.0

# This is much less code but we are still duplicating functionality in code
# block that we pass on. So this isn't DRY either. We can do better!:
to_euros = lambda { |dollars| dollars * 0.95 }
to_pesos = lambda { |dollars| dollars * 20.67 }
to_rupees = lambda { |dollars| dollars * 68.13 }

def convert(dollars, &currency_lambda)  # Don't forget & before lambda name!
  currency_lambda.call(dollars) if dollars.is_a?(Numeric)
end
# Don't forget & before lambda name!
p convert(1000, &to_euros)   # prints 950.0
p convert(1000, &to_pesos)   # prints 20670.0
p convert(1000, &to_rupees)  # prints 68130.0
# So with this, we don't need to provide our custom blocks while calling
# methods, all of them are captured in lambdas. When currency rates change,
# we just need to update appropriate lambdas, right?
# And can call these again and again:
p convert(2000, &to_euros)   # prints 1900.0
p convert(2000, &to_pesos)   # prints 41340.0
p convert(2000, &to_rupees)  # prints 136260.0

# Also, we can use map methods on arrays to use these lambdas too!
p [1000, 2000, 3000].map(&to_euros) # prints [950.0, 1900.0, 2850.0]
p [1000, 2000, 3000].map(&to_rupees) # prints [68130.0, 136260.0, 204390.0]
