## .each method on an Array
# Two ways of doing blocks here is identical to what you get in .times method.
# with <object>.times method, you get loop number and with .each, you get
# Array elements for each loop, if you define an argument with |arg| syntax.
candies = ["Sour Patch Kids", "Milky Way", "Airheads"]
candies.each do |candy|
  puts "I love #{candy} candy"
  puts "It tastes so good!"
end
# Another example on .each method
names = ["bo", "moe", "joe"]
names.each {|name| puts name.upcase}

# One more example on .each method
[1, 2, 3, 4, 5].each do |num|
  square = num * num
  puts "Square of number #{num} is #{square}"
end

# One more example on .each method
fives = [5, 10, 15, 20, 25, 30, 35, 40]
odds = []
evens = []
fives.each do |num|
  # odds.push(num) if num.odd?  # one line if statement
  odds << num if num.odd? # Used shovel operator << as shortcut for .push
  evens << num if num.even?
end
p odds  # prints [5, 15, 25, 35]
p evens # prints [10, 20, 30, 40]

# Refactored code from above example:
more_evens = []
more_odds = []
# One line block will be fine for this example!
fives.each {|num| num.even? ? more_evens << num : more_odds << num }
p more_odds  # prints [5, 15, 25, 35]
p more_evens # prints [10, 20, 30, 40]

# You can also nest .each statement when multiple arrays are involved, same Like
# nested for or while loops

## The for loop
# In Ruby, for loop is not popular and .each method is used more often, it is
# more secure and performant. It is demonstrated below
num = 100
puts "I am num and defined as #{num} else where in the code."
data = [1, 2, 3, 4]
for num in data
  puts num
end
# See, num was defined as a block variable, it should not have "leaked" to outside
# of block but it did!! This has a potential to introduce bugs! As you can see
# num was already defined above this block as 100 but it is now changed to last
# element of the array, 4! So try using .each method with Array and Ranges and
# there you don't have this issue. Block variables don't leak with them!!
puts "As num, I \"leaked\" out of for-block and now hold last element of array: #{num}"

## The .each_with_index method on arrays:
## This is super helpful method where you get index as well along with elements!
puts "\nArray method: .each_with_index demo:"
colors = ["Red", "Blue", "Green", "Yello"]
colors.each_with_index do |color, idx|
  puts "Moving on index number: #{idx}"
  puts "The current color is: #{color}"
end

## .map and .collect methods on Array
# .map and .collect do exactly same thing. It is recommended to use .map
# instead of .collect for quicker syntax
numbers = [1, 2, 3, 4, 5]
# squares = []
# numbers.each {|number| squares << number ** 2}
# p squares
# Above commented code can be simplified by map as below:
squares = numbers.map {|number| number ** 2}
p squares # [1, 4, 9, 16, 25]

# You can achieve same with .collect too, just replace .map with .collect!
# squares = numbers.collect {|number| number ** 2}

# Can also do do-end block with map
def fahrenheit_to_celcius(array)
  array.map {|fahrenneit| ((fahrenneit - 32) * 5.0/9.0).round(2)}
end

fahrenneit_arr = [32, 40, 50, 60, 65, 70, 75, 80, 90, 100, 110, 115, 120]
celcius_arr = fahrenheit_to_celcius(fahrenneit_arr)

(0...fahrenneit_arr.length).each do |index| # notice ... here instead of .. !!
  puts "#{fahrenneit_arr[index]} deg F - #{celcius_arr[index]} deg C"
end

## Apart from Ruby's built in methods with Arrays (above), you can also use
# while or until loops to iterate an array. Syntax will be like this:
# while <condition> # conditon can be i < arr.length as an example
#   <your_code_goes_here>
# end
#
# until <condition> # condition can be like i >= 10, for example
#   <your_code_goes_here>
# end
# Custom situations demand custom solutions, old school way above will help there :)

## break keyword ##
# break is Ruby works like it is in Java. Just a nice example here:
puts "\nbreak keyword demo:"
arr = [1, 2, 3, "blah", 5, 6]
arr.each do |num|
  if num.is_a?(Integer)
    puts "Square of number #{num} is: #{num ** 2}"
  else
    puts "Input element #{num} is not a number, I am out of this non-sense!"
    break
  end
end

## next keyword in Ruby is exactly like continue in Java!
# we can update above example to demonstrate next. In this example, it will
# not stop at element which is not a number and will continue to next one!
puts "\nnext keyword demo:"
arr = [1, 2, 3, "blah", 5, 6]
arr.each do |num|
  if num.is_a?(Integer)
    puts "Square of number #{num} is: #{num ** 2}"
  else
    puts "Found an element #{num} which is not a number.
          Skipping it and moving to next elements"
    next
  end
end

## reverse method
arr = [1, 2, 3]
arr.reverse
p arr   # still prints [1, 2, 3]
# use bang version of reverse, i.e. reverse! to change the original array
p arr.reverse   # this will print [3, 2, 1]
# OR do this:
arr.reverse!
p arr   # original array is now changed to its reverse: [3, 2, 1]

## .sort .sort.reverse methods
numbers = [5, -13, 1, -2, 9]
words = ["caterpillar", "kangaroo", "apple", "Zebra"]
p numbers.sort  # prints [-13, -2, 1, 5, 9]
p numbers.sort.reverse  # prints [9, 5, 1, -2, -13]
p words.sort  # prints ["Zebra", "apple", "caterpillar", "kangaroo"]
p words.sort.reverse  # prints ["kangaroo", "caterpillar", "apple", "Zebra"]
# note in above, Zebra is smallest due to ASCII order with lowercase letters
# Also note that original arrays are not changed:
p numbers # prints [5, -13, 1, -2, 9]
p words # prints ["caterpillar", "kangaroo", "apple", "Zebra"]
# use the bang version of sort, i.e. sort! to change the original arrays!

## Concating arrays: + way and .concat way:
# + way does not modify the arrays:
nums1 = [1, 2, 3]
nums2 = [4, 5]
p nums1 + nums2  # prints [1, 2, 3, 4, 5]
p nums1 # prints [1, 2, 3]
p nums2 # prints [4, 5]

# .concat way: it does modify the first array!!
p nums1.concat(nums2)  # prints [1, 2, 3, 4, 5]
p nums1 # prints [1, 2, 3, 4, 5]
p nums2 # prints [4, 5]
# a custom concat method:
puts "\nResults from my custom_concat method:"
def custom_concat(arr1, arr2)
  arr2.each {|elem| arr1 << elem}
  arr1  # last expression in a method is returned anyway
end
arr1 = [1, 3, 5]
arr2 = [7, 9]
p "arr1: #{arr1}" # [1, 3, 5]
p "arr2: #{arr2}" # [7, 9]
custom_concat(arr1, arr2)
p "arr1 after applying custom_contact method: #{arr1}"  # [1, 3, 5, 7, 9]

## .max and .min Methods
stock_prices = [23.45, 11.23, 67.88, 8.22]
p stock_prices.max  # prints 67.88
p stock_prices.min  # prints 8.22
fruits = ["apple", "kiwi", "banana", "watermelon"]
p fruits.max  # prints "watermelon"
p fruits.min  # prints "apple"

## .include? method
p fruits.include?("banana") # prints true

## .index and .find_index work same way, they're exactly identical!
p stock_prices.index(11.23) # prints index of given element, which is 1
# when not found, .index or .find_index will return nil

### .select method ###
# block for .select can only contain boolean value!! must return true or false!
# It gives back a new array depending on elements that match the criteria
grades = [80, 95, 13, 76, 28, 39]
matches = grades.select { |grade| grade > 75 }
p matches # prints [80, 95, 76]

# Another example of .select method - look for palindromes
word = ["level", "selfness", "racecar", "dinasour"]
palindromes = word.select {|word| word == word.reverse}
p palindromes # prints ["level", "racecar"]

### .reject method ###
# Opposite of .select. It rejects elements based on criteria given and
# returns the ones did not meet the criteria
animals = ["cheetah", "cat", "lion", "elephant", "dog", "cow"]
reject_results = animals.reject {|animal| animal.include?("c")}
p reject_results  # will print ["lion", "elephant", "dog"]

## Unpack a Multidimensional Array ##
# See this cool example to understand "unpacking" of Multidimensional Arrays:
users = [
  ["Bob", 25, "Male"],
  ["Susan", 48, "Female"],
  ["Larry", 46, "Ashesh"]
]
# You can use .each kind of methods, but see this:
bob, susan, larry = users
p bob # prints ["Bob", 25, "Male"]
p susan # prints ["Susan", 48, "Female"]
p larry # prints ["Larry", 46, "Ashesh"]
# magic, isn't it? :) This is "unpacking" of Multidimensional Arrays!

### .partition method does .select and .reject in one shot!! ###
# It gives a multidimensional array with one sub array that matches criteria
# and another one that doesn't. We can then unpack the results like above!
foods = ["tofu fry", "salad", "tandoori chicken", "burger",
        "pasta", "pizza", "chicken curry", "soups", "chicken tikka masala"]
good, okay = foods.partition {|food| food.include?("chicken")}
p good  # prints ["tandoori chicken", "chicken curry", "chicken tikka masala"]
p okay  # prints ["tofu fry", "salad", "burger", "pasta", "pizza", "soups"]
