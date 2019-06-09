# puts prints line break at the end.
puts "Hello world!"
puts "Hey"
puts "Man!"

# print command does not add line breaks at the end
print "YoYo"
print "Man!"

# p command is special, see its description with printed text below
p "This is some text
and p command prints strings with double quotes
around them and also prints line break symbol back slash followed by
character 'n' added in strings!"

# Basic Arithmatic, where it is different from other languages
# ** meaning exponential, in this case, its like Math.pow(2, 3) in Java
p 2 ** 3  # will print 8
p 4 ** 3  # will print 64

# Variables, assigning, printing and operating with them
a = 2
b = 3
c = 4
p a
p b
p c
# Above can also be achieve by a shortcut in Ruby
a, b, c = 2, 3, 4
p a, b, c
# Cool shortcut above, isn't it? :)

# Swapping variable made so easy in Ruby!
a, b = 10, 20
a, b = b, a # that's it, right side evaluated first as 20 and 10, then assigned
# in reverse order to variables. Print them and check out!
p a, b

# Constants: A constant in Ruby is like any other variable but convention is to
# use all upper case for them. Unline final keyword used in Java, in Ruby you can
# change a constant after first assignment but it is not recommended and Ruby
# issues a warning if you do so.

NAME = "AsheshSingh"
p "My name is constant and it is: #{NAME}."
# Try to change this constant now and you will see Ruby warning in console!!
NAME = "David"  # warning: already initialized constant NAME
p "My name constant is changed to #{NAME} and since you changed it, see
a warning in console now! Don't do this!"

# Intro to Objects and their Methods:
# Everything is an Object in Ruby, including primitives.
# .methods on any object gives methods available on that Object
p "string".methods  # prints an array of all the methods availabel on String
p 5.methods # prints all the methods on Fixnum (Integer)

p "Length of string Hello: #{"Hello".length}" # takes string object, creates
# number object representing length of this string
p "Hello".upcase
p "Hello".downcase

p 10.next # gives next number, which is 11
p -1.next # will print 0

puts "Hello world!".inspect # its like p "Hello world!" where it will give
# literal view of the object. It will print "Hello world!"

# Return Values and nil Object
# You can use IRB in terminal to try these
# Typing a number or string and enter key will output that number or string
# Entering puts 5 will return 5 and then nil because puts has to print 5
# and then since it does not return anything, it returns a null which is
# represented by nil in Ruby.
# If you do puts nil, you will see nothing (blank line) and then nil since
# nil when printed can't be seen visually but if you do p nil and enter,
# you will see nil and then nil, first one is liternal value of nil which p
# command does to any input given to it.

# String Interpolation:
# Interpolation means to inject between something else.
# This will convert number to a string and "5" will be printed
p 5.to_s
# name example above is an example of Interpolation
name = "Ashesh"
p "Hey, I am #{name} and I'm awesome! :)"

age = 46
# You'll get an error like below if you run the line below:
# p "My age is: " + age
# `+': no implicit conversion of Integer into String (TypeError)
# You do this instead:
p "My age is: " + age.to_s + " years old."  # Avoid this, its not smart way
# OR this way:
p "My age is: #{age} years old."  # Prefer this way!

# You can do any valid Ruby expression inside curly braces:
p "The result of 1 + 3 is: #{1+3}."

# The gets Method and the chomp Method:
# gets is used to get a user input. Remember input always comes as string!

# Uncomment below two lines to test it
# name = gets
# p "Great to know you #{name}! We'll be in touch"
# There's an issue with above that name will get the input string as:
# <input_string>\n
# So the enter key user presses gets concatenated to input and the whole thing
# then gets assigned to variable. So p command above will print like this:
# "Great to know you David\n! We'll be in touch"
#  Use chomp method to avoid this.

# Uncomment below two lines to test it
# name = gets.chomp
# p "Great to know you #{name}! We'll be in touch"  # will print correctly.
# chomp method removes the new line character at end of every input_string
# If we expect an integer input, we need to do it like this:

# Uncomment below two lines to test it
# age = gets.chomp.to_i # will remove \n at end and then convert string to Integer
# p "5 years later my age will be #{age + 5}!"
