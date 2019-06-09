nums = 1..5 # 1, 2, 3, 4, 5 (5 included)
p nums  # prints 1..5
p nums.class  # prints Range

# When used 3 dots, Range excludes the last number
nums_ex = 1...5 # 1, 2, 3, 4 (5 excluded)
p nums_ex
p nums_ex.class

# first and last methods on Range object:
p nums.first  # prints 1
p nums.last # prints 1
p nums_ex.first # prints 1
p nums_ex.last  # prints 5. Note: 5 will never be used though since it is excluded

# To overcome the issue of Range with 3 dots showing last element which is excluded,
# we pass on arguments to above methods like this:
p nums.first(3) # prints array [1, 2, 3]
p nums.last(1)  # prints array [5]
p nums_ex.first(2)  # prints array [1, 2]
p nums_ex.last(1) # prints array [4] So you don't get what's excluded!

# You can do above in line too. Paranthese is necessary here!
p (100..150).first(5)  # prints array [100, 101, 102, 103, 104]

# Alphabatical Ranges
p ("a".."z").first(5) # prints array ["a", "b", "c", "d", "e"]
p ("a".."z").last(5) # prints array ["v", "w", "x", "y", "z"]
alphabets = "A".."Z"
# Ruby is smart enough to ignore argument beyond 26 below!
p alphabets.first(40) # prints array of "A" to "Z" will ignore index after 0 to 25

# size method: only works on a numeric range and not on alphabatical ranges!
numbers = 143..768
numbers_ex = 143...768  # last element excluded with 3 dots!
p numbers.size  # prints 626
p numbers_ex.size # prints 625

# Check if value exists in a Range with .include? method or ===
half_alphabet = "a".."m"
p half_alphabet.include?("j") # prints true
p half_alphabet.include?("b") # prints true
p half_alphabet.include?("q") # prints false

numbers = -14...79
p numbers.include?(0) # prints true
p numbers.include?(79) # prints false since 3 dots here!

# We can also use === as a shortcut for .include? method. Helps type less!
# Note: there are very few occassiona where === operator is allowed in Ruby.
# below is one such occassion!
puts "\nCan use === operator instead of .include? to check if a number is in range!"
p half_alphabet === "j" # prints true
p half_alphabet === "b" # prints true
p half_alphabet === "q" # prints false

p numbers === 0 # prints true
p numbers === 79 # prints false since 3 dots here!

## Random Number Generation in Ruby
# rand is a method that by default gives a floating point number between 0 and 1
# and not including 1. If we pass an argument to rand method, like rand(10), it
# will give an integer from 0 to that argument but not including that.
p rand  # prints a floating point number between 0 and 1 (exclusive) with high precision
p rand.round(2) # gives floating point number between 0 and 1 (exclusive) with 2 digits after decimal
rand_num = rand(100)
p rand_num # gives an integer between 0 and 100, not including 100
# Awesomely, we can also generate a random number from our custom Range!:
num_custom_rand = rand(10..20)  # random integer between 10 to 20, 20 inclusive
num_custom_rand_ex = rand(10...20)  # random integer from 10 to 20, 20 exclusive
p num_custom_rand
p num_custom_rand_ex

p rand(5...6) # will always print 5, you know why? :)
