puts "Methods on numbers:"
p "-5.next: #{-5.next}" # gives -4 as output, which will be a numbwer too
p "9.class: #{9.class}" # will output Integer, which is a class for all the numbers. Note that
# this class used to be Fixnum with earlier versions of Ruby
p "4.54.class: #{4.54.class}"  # Will print Float, which is class for Floating point numbers
p "-3.44.class: #{-3.44.class}" # Same as above, it will be a Float class
# Very large number will be Integer now. It used to be BigNum earlier
p "999999999999999999999999999999999999999999999999999999.class:
#{999999999999999999999999999999999999999999999999999999.class}"

# Notice escaping for " by using backslash here, same like Java
# Using puts below since p, otherwise will print escape charater too, it prints a value literally, remember? :)
puts "\"5\".class: #{"5".class}" # will print String since it is of String class

# Conversion to String and to integer
puts "\nConversion to String and to integer"
puts "\"5\".to_i: #{"5".to_i}"  # will print number 5
puts "\"5\".to_i: #{"5".to_i}"  # will print Integer since "5" is converted to an Integer
p "566.to_s: #{566.to_s}" # will print "566"
p "566.to_s.class: #{566.to_s.class}"  # will print String since 566 is converted to a String

# More on number conversion. Note that original field str is never changed!
puts "\nMore on number conversion:"
str = "5"
p "str: #{str}" # will print "5"
p "str.class: #{str.class}" # will print String
p "str.to_i.class: #{str.to_i.class}"  # will print Fixnum (or Integer for newer Ruby)
p "str.to_f: #{str.to_f}"  # will print 5.0 since str is float now
p "str.to_f.class: #{str.to_f.class}"  # will print Float class name

# Float to Integer conversion
puts "\nFloat to Integer conversion:"
pi = 3.14
p "pi.to_i: #{pi.to_i}" # removes decimal part and prints 3. It always rounds down!
p "pi.class: #{pi.class}"  # will print Float
p "pi.to_i.class: #{pi.to_i.class}" # will print Fixnum

# Booleans
puts "\nBooleans:"
puts
p "5 < 6: #{5 < 6}" # will print true
p "20 < 17: #{20 < 17}" # will print false
age = 46
good_human = true
stupid = false
p "good_human.class: #{good_human.class}"  # will print TrueClass
p "stupid.class: #{stupid.class}"  # will print FalseClass

# Predicate methods: .odd? and .even?
puts "\nPredicate methods: .odd? and .even?:"
p "1.even?: #{1.even?}" # will print false
p "16.even?: #{16.even?}"  # will print true
p "33.odd?: #{33.odd?}" # will print true
p "366.odd?: #{366.odd?}"  # will print false
# p 2.99.odd? # don't do this, you'll get error since even? or odd? methods are available in Fixnum (or Integer) class only

# Comparision operator
puts "\nComparision operator:"
p "10 == 10: #{10 == 10}"  # will return true
a, b, c = 10, 5, 10
p "a == c: #{a == c}" # will return true
p "c <= a: #{c == a}" # will return true
p "a == b: #{a == b}" # will return false
puts "\"5\" == 5: #{"5" == 5}" # will print false since String and Fixnumbeing compared, they're different objects
puts "\"5\" == \"5\": #{"5" == "5"}"  # will print true. Notice, this is different from Java! its like "5".equals("5") there :)
# This might sound bizzare!
num1 = 5  # of a Fixnum (Integer) class
num2 = 5.0  # of a Float (class)
p "num1: #{num1}", "num2: #{num2}", "num1.class: #{num1.class}", "num2.class: #{num2.class}"
# Now see!
p "5 >= 5.0: #{5 >= 5.0}!"  # will print true, even if their classes are not same. It happens only with numbers :)
# You can also change the datatypes and then compare:
p "23 == 23.3.to_i: #{23 == 23.3.to_i}" # will return true
# OR
p "34.0 == 34.to_f: #{34.0 == 34.to_f}" # will return true

# Arithmatic Methods and Basic Arguments
# Parantheses after a method is optional in Ruby if it does not take any argument like:
puts "\nArithmatic Methods and Basic Arguments:"
p "p 67.next and p 67.next() both will work fine, since next does not take any argument, and print: #{67.next()}"
p "But a method like +() will take parantheses to provide argument: 1.+(4): #{1.+(4)}"
puts "10 - 5 is same as calling -() method exclusively: 10 - 5 == 10.-(5)? #{10 - 5 == 10.-(5)}"
puts "In fact parantheses is not required in Ruby!! 10.- 5 will also work fine: #{10.- 5}"
p "However, it is more cleaner and less error prone to provide paranthese when at least one argument is needed."
puts "11 * 5 is same as calling *() method on object 11 exclusively: 11 * 5 == 11.*(5)? #{11 * 5 == 11.*(5)}"
# divide method
puts "20 / 4 is same as calling /() method on object 20 exclusively: 20 / 4 == 20./(4)? #{20 / 4 == 20./(4)}"
puts "20 / 4 is also same as calling div() method on object 20 exclusively: 20 / 4 == 20.div(4)? #{20 / 4 == 20.div(4)}"
# modulo Methods
puts "11 % 3 is same as calling %() method on object 11 exclusively: 11 % 3 == 11.%(3)? #{11 % 3 == 11.%(3)}"
puts "11 % 3 is also same as calling modulo() method on object 11 exclusively: 11 % 3 == 11.modulo(3)? #{11 % 3 == 11.modulo(3)}"

# The .between? Predicate Method
puts "\nThe .between? Predicate Method:"
puts "3.between?(2, 5): #{3.between?(2, 5)}"  # will returbn true
puts "\"cat\".between?(\"apple\", \"dog\"): #{"cat".between?("apple", "dog")}"  # will returbn true
puts "\"man\".between?(\"people\", \"god\"): #{"man".between?("people", "god")}"  # will returbn false

# Float Methods
puts "\nFloat Methods:"
puts "6.98.to_i: #{6.98.to_i}"  # will print 6
puts "87.45.floor: #{87.45.floor}"  # will print 87
puts "87.45.ceil: #{87.45.ceil}"  # will print 88
puts "87.45.round: #{87.45.round}"  # will print 87
puts "87.51.round: #{87.51.round}"  # will print 88
# Below is really cool! You can specify the number of digits after decimal you need to be rounded to
puts "3.14159.round(2): #{3.14159.round(2)}"  # will print 3.14
puts "5.14559.round(2): #{5.14559.round(2)}"  # will print 5.15!
puts "-456.abs: #{-456.abs}"  # will print 456 (positive number)

# Assignment Operators
puts "\nAssignment Operators:"
a, b, c = 3, 4, 5
p "a = #{a}, b= #{b}, c= #{c}"
puts "a += 5: #{a += 5}"  # prints 8
puts "b -= 1: #{b -= 1}"  # prints 3
puts "a *= 5: #{a *= 5}"
puts "b /= 2: #{b /= 2}"
puts "Very similar to above, you use %= for modulo and **= for exponential operators."

# Blocks with the .times Method
puts "\nBlocks with the .times Method:"
puts "One way is to use curly brances: <object>.times { }"
puts "Hey man,"
# prints "Where are you?" 3 times. Here, times is a method in Fixnum (Integer) object
3.times { puts "Where are you?" }
puts "Alternate syntax is to use do and end keywords: <object>.times 'do' <lines_to_be_repeated> 'end'"
2.times do
  puts "Ashesh is awesome!"
  puts "Agree? :)"
end
p "Best practice is to use curly braces for one line to repeat and 'do' and 'end' when multiple lines need to repeat."
puts "\nYou can also use block variables for blocks and they are only accessible inside the block:"
puts
3.times do |count|  # block variable count will start from 0, goes to 1 and then 2 here.
  puts "Loop Number: #{count}"  # block variable name can be anything which is not a Ruby reserved word.
  puts "Hello People!"
  puts
end
# block variable 'count' above is not available here (outside the block) and 'puts count' here will be an error:
# puts count
# You can use block variable with curly braces type .times method too, remember here,
# that right after begining curly brace, you'll have to start a pipe char followed by loop variable name.
2.times {|num| puts "We are on loop number #{num}"}
# ###Challenge###
# Print 5 multiples of 3 using block variable
multiplier = 3
5.times do |var|
  puts "#{3 * var.next}"  # Should use curly braces type .times here since it is just one line
end # will print 3, 6, 9, 12 and then 15
# Multiple of 4 using curly brace type syntax of .times method:
3.times {|num| puts "#{4 * num.next}"}

# .upto and .downto Methods
puts "\n.upto and .downto Methods:"
5.downto(2) {|i| puts "Countdown: #{i}"}  # i will vary from 5 to 2
3.upto(6) {|i| puts "Countup: #{i}"}  # i will vary from 3 to 6
# .upto or .downto can also be used with do - end loop
6.upto(10) do |current_pos| # do - end loop for multiple statement repeats is best practice
  puts "We're movin on up!"
  puts "Our current count is: #{current_pos}"
end # will print above two statements for current_pos = 6 till 10

# .step method
# Done on a number, takes two args, maxNum and increment
1.step(20, 5) {|i| puts "#{i}"} # prints 1, 6, 11, 16
0.step(30, 5) {|i| puts i } # prints 0, 5, 10, 15, 20, 25, 30
# Like .times, .upto or .downto methods, you can have do - end block as well to loop with multiple statements
# If increment of 1 is needed, then .upto or .downto seems more logical.
# .step method comes handy when there is custom increment (other than 1)
