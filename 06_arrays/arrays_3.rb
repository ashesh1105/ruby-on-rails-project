## .object_id method called on an object gives a unique identifier for
# address of this object in heap, where objects are located.
a = [1, 2, 3]
b = a.dup # create array b by duplicating a, so a separate object altogether
p a == b  # print true, because Ruby behind the scene compares the objects
# but...
p a.object_id == b.object_id  # prints false
# this is because:
p a.object_id # prints 70242584251660 (hardware specific)
p b.object_id # prints 70242584251640 (hardware specific)

### Splat Arguments: helps when number of args passed to a method can vary
## Defined in method by: *<arg_name>, and can then be accessed in method
# by: arg_name as an array. You can for .each or .each_with_index on it
def sum(*arguments)
  sum = 0
  arguments.each {|arg| sum += arg}
  sum
end
p sum(1, 2) # prints 3
p sum(4)  # prints 4
p sum(2, 2, 2, 2, 2, 3) # prints 13

### .any? and .all? methods:
## .any?: Return true if any of array elements satify condition we give in block
# .all?: Return true if all of array elements satify condition we give in block
p [1, 3, 5, 7, 10].any? { |elem| elem.even? } # returns true
p [12, 2, 4, 7, 10].all? { |elem| elem.even? } # returns false, 7 is odd
p [12, 2, 4, 8, 10].all? { |elem| elem.even? } # returns true

### .find method takes a block with boolean value and gives first element that
## satisfies the given condition in block. Works exactly like .select, except
# .select gives you all elements satisfying condition,
# .find gives just first one. .find and .detect methods are completely identical
words = ["dictionary", "refrigerator", "platypus", "microwave"]
# this .select prints array: ["dictionary", "refrigerator", "microwave"]:
p words.select {|word| word.length > 8 }
# .find will find just the first match and it will be a string here:
p words.find { |word| word.length > 8 } # prints string "dictionary"
# You can find last element matching condition by reversing the string and .find
p [1, 2, 3, 4, 5].reverse.find { |num| num.odd? } # returns 5

### .uniq method returns an array with all its duplicates removed.
## .uniq method does not modify original array, gives a new one.
# use the corresponding bang version of it (.uniq!) to modify original array.
nums = [1, 2, 4, 8, 1, 2, 9, 4]
p nums.uniq # prints [1, 2, 4, 8, 9]

### .compact method removes all the nil values from array and returns new array
words = ["a", "gft", "abc", nil, "rta", nil]
p words.compact # prints ["a", "gft", "abc", "rta"]

###
### .inject and .reduce methods on Array are exactly identical. Use one of them!
## Helps get reduce functionality on elements of an array.
# It works as follows:
# The block provided to .reduce method is called again and again with
# two given arguments: previous and current. Last expression is returned in Ruby
# and there we are simply adding previous to current, whcih becomes new previous
# when block is called for next element and we return previous + current again.
# Hence when last time block is called for last element of the array, the sum total
# of the array is returned, which we are saving in result variable.
puts "\nArray.reduce method demo:"
result = [10, 20, 30, 40].reduce(0) do |previous, current|
  puts "previous value was: #{previous}"
  puts "current value is: #{current} \n\n"  # added \n\n to see iterations clearly
  previous + current
end
p "Result: #{result}"
# You can see the console output to verify the theory above on how .reduce works:
# previous value was: 0
# current value is: 10
#
# previous value was: 10
# current value is: 20
#
# previous value was: 30
# current value is: 30
#
# previous value was: 60
# current value is: 40
#
# "Result: 100"

# Here is another example on .reduce method for rolling product.
# Note: here we need to start with 1 as previous
# since 0 multiplied to anything is 0!
puts "\nAnother .reduce example:"
nums = [3, 4, 5, 6, 7]
result = nums.reduce(1) do |previous, current|  # reduce(1) means start with previous as 1
  puts "previous value was: #{previous}"
  puts "current value is: #{current} \n\n"  # added \n\n to see iterations clearly
  previous * current
end
p "Result: #{result}"  # prints
# Here's the output for you to understand the processing for this as well once more:
# previous value was: 1
# current value is: 3
#
# previous value was: 3
# current value is: 4
#
# previous value was: 12
# current value is: 5
#
# previous value was: 60
# current value is: 6
#
# previous value was: 360
# current value is: 7
#
# "Result: 2520"

###
### .flatten method removes dimensions from a multidimensional array and gives back
## new one dimensional array. It does not matter how deep the array is nested!
# Also, it does not mutate original array. Use bang version for this(.flatten!)
registrations = [
                  ["Bob", "Dan", "Jack"],
                  ["Rick", "Susan", "Ashesh"],
                  ["Pierce", "Sean", "George"]
]
# We can always unpack them as below:
a, b, c = registrations
p a, b, c # then will give all three sub arrays to me in different variables
# But what if I don't care about groups and just want to grab all the names who
# registered? I can do this by .flatten method:
# Below code will print:
# ["Bob", "Dan", "Jack", "Rick", "Susan", "Ashesh", "Pierce", "Sean", "George"]
p registrations.flatten

###
### .zip method helps combine multiple arrays into one while storing the sequence
## among each of them!
names = ["Bo", "Moe", "Joe", "Lily"]
registrations = [true, false, false]
# Below will print: [["Bo", true], ["Moe", false], ["Joe", false], ["Lily", nil]]
# Note: how "Lily" was combined with nil object since no registrations element was
# to be combined with it! Similar thing would happen if names had lesser elements!
p names.zip(registrations)

# You can also combine more than 2 arrays this way:
# below will print: [[1, "cool", "true"], [2, "angry", "false"], [3, "passionate", "true"]]
p [1, 2, 3].zip(["cool", "angry", "passionate"], ["true", "false", "true"])


### .sample method returns one or more elements from array in random order
nums = [1, 2, 3, 4, 5]
p nums.sample # returns an element of array randomly
p nums.sample(2)  # returns an array of two randomly selected elements of array
# Below will be like shuffle method where all elements are returned in random order
p nums.sample(nums.length)
# general format: Array.sample(n), where n is how many elements we need randomly
# Ruby is "forgiving", so if n > array.length, it will still all elements in random order


### Multiple an array with Astrisk symbol:
## * <number> gives new array where elements are just duplicated that many times
# We know:
p "Ruby" * 3 # prints "RubyRubyRuby"
# Below code behaves very similar to above
p [1, 2, 3] * 3  # prints [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3] !!


### .union ( | ) combines multiple arrays into one and removes duplicates:
p [1, 2, 3] | [2, 3, 4, 5] # prints [1, 2, 3, 4, 5]
p ["a", "b"] | ["b", "c", "d"] | ["b", "c", "d", "e"] # prints ["a", "b", "c", "d", "e"]
# Side note: you can achieve same by: returning arr1.dup.concat(arr2).uniq from a method


### Remove elements that exist in another array with .- (minus method):
p [1, 2, 2, 3, 4, 2, 2, 3, 4, 3].-([2, 3])  # prints [1, 4, 4]


### Array Intersection with Apmersand (&) symbol:
p [1, 2, 3, 3, 5, 2, 1] & [23, 2, 14, 19, 5]  # prints [2, 5]
# You can also use above like .& method: p [1, 2, 3, 3, 5, 2, 1].&([23, 2, 14, 19, 5])
# Result will be the same!
