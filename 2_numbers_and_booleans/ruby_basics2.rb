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
puts "\"5\".to_i: #{"5".to_i}"  # will print number 5
puts "\"5\".to_i: #{"5".to_i}"  # will print Integer since "5" is converted to an Integer
p "566.to_s: #{566.to_s}" # will print "566"
p "566.to_s.class: #{566.to_s.class}"  # will print String since 566 is converted to a String

# More on number conversion. Note that original field str is never changed!
str = "5"
p "str: #{str}" # will print "5"
p "str.class: #{str.class}" # will print String
p "str.to_i.class: #{str.to_i.class}"  # will print Fixnum (or Integer for newer Ruby)
p "str.to_f: #{str.to_f}"  # will print 5.0 since str is float now
p "str.to_f.class: #{str.to_f.class}"  # will print Float class name

# Float to Integer conversion
pi = 3.14
p "pi.to_i: #{pi.to_i}" # removes decimal part and prints 3. It always rounds down!
p "pi.class: #{pi.class}"  # will print Float
p "pi.to_i.class: #{pi.to_i.class}" # will print Fixnum

# Booleans
p "5 < 6: #{5 < 6}" # will print true
p "20 < 17: #{20 < 17}" # will print false
age = 46
good_human = true
stupid = false
p "good_human.class: #{good_human.class}"  # will print TrueClass
p "stupid.class: #{stupid.class}"  # will print FalseClass

# Predicate methods: .odd? and .even?
p "1.even?: #{1.even?}" # will print false
p "16.even?: #{16.even?}"  # will print true
p "33.odd?: #{33.odd?}" # will print true
p "366.odd?: #{366.odd?}"  # will print false
# p 2.99.odd? # don't do this, you'll get error since even? or odd? methods are available in Fixnum (or Integer) class only

# Comparision operator
p "10 == 10: #{10 == 10}"  # will return true
a, b, c = 10, 5, 10
p "a == c: #{a == c}" # will return true
p "c == a: #{c == a}" # will return true
p "a == b: #{a == b}" # will return false
puts "\"5\" == 5: #{"5" == 5}" # will print false since String and Fixnumbeing compared, they're different objects
puts "\"5\" == \"5\": #{"5" == "5"}"  # will print true. Notice, this is different from Java! its like "5".equals("5") there :)
# This might sound bizzare!
num1 = 5  # of a Fixnum (Integer) class
num2 = 5.0  # of a Float (class)
p "num1: #{num1}", "num2: #{num2}", "num1.class: #{num1.class}", "num2.class: #{num2.class}"
# Now see!
p "5 == 5.0: #{5 == 5.0}!"  # will print true, even if their classes are not same. It happens only with numbers :)
# You can also change the datatypes and then compare:
p "23 == 23.3.to_i: #{23 == 23.3.to_i}" # will return true
# OR
p "34.0 == 34.to_f: #{34.0 == 34.to_f}" # will return true
