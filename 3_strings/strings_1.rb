name = "Ashesh"
revenue = "$23 dollars"
puts name, revenue  # shortcut of printing multiple strings with line breaks

# length method
puts "name.length: #{name.length}"

# .class
puts "name.class: #{name.class}" # prints String, the class name

# .new method, alternate syntax to create Strings
name = String.new("David")
puts "Created with String.new method: #{name}"

# Multiline_Strings
# You use custom indicator to begin and end in it.
puts "\nMultiline String example:"
words = <<MLS
  This is going to be a multi-line String.
  MLS is our custom indicator to begin and end the multi-line String
  This could be AKS, ABCD, XYZ or just anything.

Tabs will also be preserved.
Good Bye!
MLS
puts words  # will print above multi-line String between two MLS as it is!

# Difference between single and double quoted Strings
puts "\nDifference between single and double quoted Strings:"
puts "1. Line breaks don't work in single quotes:"
puts "Hello\nWorld" # will print Hello and World on separate lines
puts 'Hello\nWorld' # will print Hello\nWorld and ignores line breaks
puts "2. Single quotes do not interpolate:"
phrase = "Hello People!"
puts "With double quotes: #{phrase}, are you there?"  # interpolates
puts 'With single quotes: #{phrase}, are you there?'  # prints everything literally

# Equality and Inequality operators with Strings
puts "\nEquality and Inequality operators with Strings:"
a = "Hello"
b = "hello"
c = "Hello"
puts "#{a} == #{b}: #{a == b}"  # prints false
puts "#{a} != #{b}: #{a != b}"  # prints true
puts "#{a} == #{c}: #{a == c}"  # prints true
puts "Apple < Banana: #{"Apple" < "Banana"}"  # prints true
puts "help > hello: #{"help" > "hello"}"  # prints true since 4th char in help comes after that of hello
puts "A < a: #{"A" < "a"}"  # prints true since 'A' comes before 'a' in ASCII order

# Concatenate Strings
puts "\nConcatenating Strings:"
first_name = "Harry"
last_name = "Potter"
puts "#{first_name} + " " + #{last_name}: #{first_name + " " + last_name}" # prints Harry Potter
# Can also use += here
name = ""
name += first_name
name += " "
name += last_name
puts name # prints Harry Potter
first_name.concat(last_name)  # Note, first_name now becomes HarryPotter!
p first_name  # prints HarryPotter
# Use << (shovel) operator. Here you can use as many strings as you want!
a = "Things"
b = "are great"
c = "here!"
p a << " " << b << " " << c # prints Strings with a space in between and variable a now holds the final result.
# prepend method. adds given string to begining of original string
a = "Home"
b = "Nice"
a.prepend(b)  # adds value of b to begining of a and a gets this new value
p a # prints "NiceHome"

# length and size methods are totally identical!
puts "\nYou can use .length or .size methods, they are exactly identical!"
puts "a.length == a.size: #{a.length == a.size}!"  # prints true!

# Iterate through chars of String
word = "Once upon a time in a land far, far away"
p word.length # prints 40
p word[0] # prints "O"
p word[3] # prints "e"
# You can also use negative indices, unlike other programming languages!!
p word[-1]  # prints last char of this String: "y"
p word[-4]  # prints 4th last char of this String: "a"
p word[-40] # prints last 0 element of this String, i.e. 1st char: "O"
p "word[-word.length]: #{word[-word.length]}"  # same result like above, i.e., first char of String is printed
p word[100]   # this index doesn't exist, so result will be nil object
p word[-300]  # prints nil as well
# slice method can give chars of Strings too
p word.slice(3) # will print "e"
p word.slice(-39) == word[-39]  # will print true as both gives "n"

# Extract muliple characters of a String
# You can use String[] or String.slice() interchangibly
story = "Once upon a time in a land far, far away..."
p story[4, 5] # will print " upon" begining from index 4 and gets 5 chars from there
p story.slice(4, 5) # result will be same: " upon"
p story[0, story.length] # prints entire String
p story[-7, 4]  # prints "away"

# Extract multiple chars of String using Range object
# Same as above, string.slice() can be used interchangibly with story[]
p "story[27..39]: #{story[27..39]}" # prints char at index 27 till 39: "far, far away"
p story.slice(0..story.length-1)  # prints entire string
p story[-38..-35] # will print from char at -38 till -35: "upon"
# # If we add one more dot in above Range object, it will make last index as exclusive!!!
p story[27...39] # prints char at index 27 till 38: "far, far awa"
p story.slice(0...story.length)  # prints entire string
p story[-38...-35] # will print from char at -38 till -34: "upo"
# What happens if we specify range higher than length of string?
# Ruby is smart to go as far as String exits and then cut it off there, no OutOfBounds error given unlike other languages!!
p story[0...100]  # prints entire string, no error!
# So below will also give entire string even if string.length index is outside of string range (index starts at 0!)
p story[0..story.length]  # prints entire string, no error!
p story.slice(32..2000) # prints "far away..." with no error!!
p story[25..-9] # prints "d far, far"

# String Manupulations
puts "\nStrings in Ruby are Mutable unlike many programming languages!!"
thing = "rocket ship"
p "thing: #{thing}"
thing[0] = "P"
puts "With operation: thing[0] = \"P\", thing now becomes: #{thing}"  # prints "Pocker ship"
thing[thing.length - 1] = "t"
p thing # prints "Pocket shit"  # prints "Pocket shit" :)
thing[7] = "S"
thing[thing.length - 1] = "p"
p thing # prints "Pocket Ship"
# Change multiple chars of a String:
fact = "I love blueberry pie"
fact[7, 4] = "rasp" # replaces "blue" to "rasp" in fact String
p fact  # prints "I love raspberry pie"
# Let's change this back to original fact string using Range object
fact[7..10] = "blue"
p fact  # prints "I love blueberry pie"
# Amazingly, you can replace substring with another one with less of more length too!!
fact[2, 4] = "absolutely love"  # replace "love" with "absolutely love"
p fact  # prints "I absolutely love blueberry pie"

# Case methods of String
puts "\nCase methods of String:"
# Note that capitalize method does not change original string, it gives a new one.
puts "hello".capitalize # Capitalizes first char of a String
# Even if string has muiltiple words, capitalize changes first character only
puts "hello world!".capitalize  # prints Hello world!
puts "ashesh123".upcase # Capitalizes all letters, prints ASHESH123
puts "aShEsH123".downcase # prints ashesh123
# swapcase method swaps the cases, lower case to upper and vice versa!
puts "asHEsh".swapcase  # prints ASheSH

# reverse method on a string, returns back a brand new string
puts "\nreverse method on a string:"
puts "Ruby".reverse # prints ybuR
# You can chain these methods since one method returns another string object
puts "Ruby".reverse.upcase  # prints YBUR after method chaining

# Bang methods on strings. They have side affects, they mutate original objects
puts "\nBang methods on strings:"
word = "hello"
puts word.capitalize  # Note: this does not mutate word, it just outputs a new string: "Hello"
word.capitalize!  # this is Bang version of capitalize method, that actually changes word to "Hello"
p word  # now will print "Hello"!
# Note that capitalize and capitalize! are two different methods!
# Former does not mutate the original object and later one does!
# Similarly upcase! will mutate word string, upcase method did not do it above
word.upcase!
p word  # will now print "HELLO"!
word.downcase!
p word  # will now print "hello" since it lower cased original word string
word.reverse!
p word  # will now print "olleh", it is permanently changed!
word.swapcase!
p word  # will print "OLLEH"
# All of above are new methods and not same as their non-Bang method counterparts

#.include method on strings
puts "\n.include method on strings"
# Returns true if string contains the input string argument given
name = "Snow White"
p name.include?("h")  # prints true since name contains argument string "h"
p name.include?("ite")  # prints true like above
p name.include?("op") # prints false
p name.include?("s")  # will return because name has "S" and no "s". Its case sensitive.
# if we are doing case insensitive search, we can chain the string, "normalize" it in this case:
p name.downcase.include?("s") # this will now print true
p name.upcase.include?("SN")  # will also return true now
# Note: we did not use Bang equivalent of above methods, so original string was not mutated!

# .empty? and .nil? methods
puts "\n.empty? and .nil? methods:"
p "".empty?   # will return true
p "d".empty?  # will return false
p "".nil? # will rerurn false since an empty string is not nil
name = "Donald Duck"
last_name = name[100, 4]  # this will be nil
p last_name.nil?  # will print true
actual_last_name = name[name.length - 4, name.length - 1]  # should contain "Duck"
p actual_last_name  # prints "Duck"
p actual_last_name.nil?  # will return false
