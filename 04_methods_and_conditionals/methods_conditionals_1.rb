# This is how you define a method in Ruby
# Methods must be defined before you can call it because Ruby Interpreter reads
# code from top to bottom and it should find the def before being invoked.
def introduce_myself(name, trait) # notice, no curly braces here!
  puts "My name is #{name} and I am #{trait}!"
end # this is how you end methods in Ruby

# And this is how you call a method
# Best practice is not include add () at the end of method name
# unless you have pass arguments into it
introduce_myself("Ashesh", "sincere")
introduce_myself("David", "hard working")
introduce_myself("Shiela", "result oriented")

# Return statement in Ruby
def add_nums(num1, num2)
  puts "\nI am add_nums method and my job is to add #{num1} and #{num2}"
  # You can chose to return line commented line below explicitely with return keyword
  # return num1 + num2
  # OR, like Golang, Ruby can return the last expression in method without return keyword
  num1 + num2
  # Note: implicit returns with return keyword are used when we need to return
  # earlier before end of method. When return keyword used, Ruby ignores last expression.
end

# call above method
p add_nums(3, 6)  # prints 9

# Default return value for an empty method is nil:
def nothing
end
nothing # will print nil, you won't see anything on console :)

# puts method return nil
def guess_return
  puts "Will this statement be returned by guess_return method?"
end
guess_return  # will print nothing since puts method is last expression in called method which returns nil

# if-else-elsif condition:
puts "\nif-end condition:"
num1 = 7
num2 = 13
maxVal = 15
if num1 > num2  # Note: No curly braces here!
  puts "num1(#{num1}) is greater than num2(#{num2})"
elsif num2 <= maxVal  # Notice how elsif keyword is written!
  puts "num2(#{num2}) is greater than num1(#{num1})"
else
  puts "num2(#{num2}) is too big to evaluate!"
end # this is how you end an if-else block

word = "Zebra"
arg = "eb"
if word.include?("eb")
  puts "word #{word} does contain the string #{arg}"
end

num = 5
if num.odd?
  puts "That number #{num} is odd!"
end

# Truthiness and Falsiness
# Like JavaScript, Ruby works based on Truthy or Falsy values in if statements
puts"\nExcept false and nil, every thing in Ruby is Truthy!!"
if 5
  puts "This was truthy!" # will always print
end
# Commenting below two if statements to avoid warnings
# if "" # it will work but you'll get a warning for using string literal here
#   puts "This was truthy too!" # will always print
# end
# if "hello"  # will work with a warning too
#   puts "This was truthy!" # will always print
# end
if []  # array is also truthy
  puts "This was truthy!" # will always print
end
if {}  # a hash is also truthy
  puts "This was truthy!" # will always print
end
# above condition will evaluate true unless false or nil is used
if false
  puts "This is falsy"  # will never print
end
if nil
  puts "This is falsy"  # will never print
end

# && and || Operators in Ruby
# Like Java, Ruby also does short-circuit evaluation!
age = 46
ticket = "General Admission"
id = true
if age > 21 && ticket == "General Admission" && id
  puts "Congratulations, welcome to show!"
end
# Let's change id to false
id = false
if age > 21 || id # won't even check id since age > 21 is true
  puts "You get the ticket anyway!"
end

# Parantheses is always optional in Ruby but you can use it when you want
# to, for example, to declare precedence in if statement evaluation.
a, b, d, e, f = 1,2,3,4,5
if (a == b && d > f) || e * 5 < 30
# Do something
end

# You can have multiple end keywords when nested if statements
time_of_week = "weekday"
time_of_day = "lunch"
if time_of_week == "weekday"
  if time_of_day == "lunch"
    puts "Cereal"
  elsif time_of_day == "dinner"
    puts "Pasta"
  else
    puts "Snacks"
  end
end # Notice multiple end keywords to indicate end of certain level of if statement

# .respond_to? method. Checks if an object has a method that we can call on it
puts "\nrespond_to? method on objects"
p 5.respond_to?("next") # prints true since object 5 does has this method
p 1000.respond_to?("length")  # prints false since Fixnum (or Integers) object doesn't have length method
# Then you can use these in if condition
num = 1000
if num.respond_to?("next")
  puts num.next # prints 1001
end
# Similarly..
puts "Hello".respond_to?("odd") # will print false
## You can also use symbol syntax for .respond_to? this way:
puts "Hello".respond_to?(:length) # prints true
# So in above, use a colon and then method name to check instead of using double quotes
puts 1.respond_to?(:next) # prints true
### Symbol systax used above is much better compared to strings,
# it is quicker and consumes less memory!

# Ternary Operator is also available in Ruby like any other programming languages
puts 5 > 3 ? "5 is greater than 3" : "No, 5 is not greater than 3"
result = "hello".length > "hell".length ? "hello" : "hell"
p result  # prints "hello"

def even_or_odd(num)
  # notice below, the last expression is conditionally returned!
  num.even? ? "number was even" : "number was odd"
end

p even_or_odd(5)  # prints "number was odd"
p even_or_odd(12) # prints "number was even"

# Default or Optional Parameters for methods
# All optional or default method parameters must be placed at end of the list!
# Above is important because we can't call a method like a_method(a,,b)..!!
def make_phone_call(number, international_code=1, area_code=408)
  "#{international_code}-#{area_code}-#{number}"
end

puts make_phone_call("123-4567", "1", "598")  # prints 1-408-123-4567
puts make_phone_call("456-7899", "1") # prints 1-408-456-7899
puts make_phone_call("345-6789")  # prints 1-408-345-6789!
# So this is how you provide optional method arguments with default values
# If you don't pass optional arguments in methods, default values kick-in!
