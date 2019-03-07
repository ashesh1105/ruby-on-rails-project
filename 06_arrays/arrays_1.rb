p []  # prints a blank array
p [].class  # prints Array
numbers = [4, 8, 15, 22, 29]
puts numbers  # prints array elements on a speparate line
p numbers # prints array as [4, 8, 15, 22, 29]
print numbers # similar to p numbers output

toys = ["Teddy bear", "Super Soaker", "board game"]
p toys  # prints array: ["Teddy bear", "Super Soaker", "board game"]
puts toys # prints array elements on a separate line
print toys  # similar to p toys output

puts  # get a line break here

# Like JavaScript, an array can have objects of any data types!
things = [4, true, "Hello", 10.99]
p things  # will print the array as it is

# Array of arrays (2D array)
# Since array is an object itself, it can consit of other nested arrays:
students = [
  ["Sally", 25, true],  # student_name, grade, good_student_or_not
  ["Vidhya", 29, true],
  ["Some_name", 19, false]
]
p students
# Note: in above, child arrays don't need to be of same size!

# There is a special syntax to create string arrays
# Comes handy when we have long list of string array elements
# A catch here is, space is considered as delimiter between elements so when
# you have an element with multiple strings, say, Anne Marie, they'll become two
# separate Array elements with this syntax:
names = %w[Jack Jill John James]  # Notice no double quotes or commans between!
p names # prints ["Jack", "Jill", "John", "James"] !!

# Arrays.new method to create Arrays:
arr = Array.new(3)  # creates an array with 3 nil values
p arr   # prints [nil, nil, nil]
# we can pass another argument in new method as values we need in array:

arr_1 = Array.new(3, true)
p arr_1 # prints [true, true, true]

arr_2 = Array.new(5, 0) # this is kind of default in Java integer arrays
p arr_2 # prints [0, 0, 0, 0, 0]

arr_3 = Array.new(3, "Hello")
p arr_3 # prints ["Hello", "Hello", "Hello"]

arr_4 = Array.new(3, [1, 2, 3])
p arr_4 # prints [[1, 2, 3], [1, 2, 3], [1, 2, 3]]

# .length and accessing arrays by index works same way as other languages except
# here if you specify index out of bounds, you don't get exception, you just get
# a nil object!
# Also, you can use negative index too, -1 means last element and -arr.length
# will mean first element. Anything outside of this range will give nil.
p arr_1[2] # prints true
p arr_3[100]  # prints nil! So no ArrayIndexOutOfBounds Exception like Java here!
p names[-1] # prints "James", the last element of names array defined above
p names[-2] # prints John, the 2nd last element of array names
p names[-names.length] # prints Jack, the first element of array names

## .fetch method
# We saw above that with array[index] syntax, if index is out of bounds, it
# returns a nil and no error but how about we want to catch that error in our code or
# want to have it return false, or any other array, any other objet? We do this
# by .fetch method:
# p names.fetch(100) # will cause an error, so commenting it
p names.fetch(100, false) # since index 100 doesn't exist in names, it will print false
p names.fetch(100, ["Not found", false, 400]) # will return our custom array: ["Not found", false, 400]

## Extract sequencial array elements with bracket syntax:
numbers = [1, 3, 5, 7, 9, 15, 21]
# gives a sub array of 4 elements starting from index 2:
p numbers[2, 4] # prints [5, 7, 9, 15]
p numbers[0].class  # will print Fixnum (or Integer based on Ruby version)
p numbers[0, 1].class # will print Array
# Ruby is smart to ignore out of bounds index ranges
p numbers[2, 100] # prints [5, 7, 9, 15, 21]

## Extract sequencial array elements with Range objects:
p numbers[0..2] # prints [1, 3, 5]
p numbers[2...5]  # prints [5, 7, 9] not including index 5 since 3 dots!
p numbers[2..2] # prints [5]

## Access Multiple Array elements with .values_at method:
# Here we can get non-sequencial elements as well at our desired indices at once!
# We can't accomplish this with Ranges since they give it sequentially
p numbers.values_at(0, 3, 4, 6) # prints [1, 7, 9, 21]
p numbers.values_at(4, 6, 25) # prints [9, 21, nil]
p numbers.values_at(2, 2, 5, 0, 3, -3)  # prints [5, 5, 15, 1, 7, 9]

# .slice method works exactly like [] syntax!
p numbers.slice(2)  # prints number 5 (not array, same as numbers[2])
p numbers.slice(2, 2)  # prints array [5, 7]
p numbers.slice(2..4) # prints array [5, 7, 9]

## Overwrite one of more array elements
fruits = ["apple", "orange", "grape", "banana"]
p fruits  # prints array
# You can change existing elements by referencing referencing it with index
# Can also add new element this way:
fruits[4] = "passionfruit"
p fruits  # will print array with new element at the end
# what happens if we add at index more than 1 position away from current last one?
fruits[6] = "watermelon"
p fruits  # prints array with index 5 element as nil and then "watermelon"
# replace multiple elements
fruits[2, 2] = ["strawberry", "blueberry"]
p fruits  # replaces elements at 2 and 3 by new fruits added above
fruits[0..2] = ["raspberry", "kiwi", "canteloupe"]
p fruits  # First 3 positions were replaced by above 3 fruits
p fruits.length # prints 7

# We can reduce the length of array by supplying fewer elements for positions:
fruits[0..2] = ["blackberry"]
p fruits.length # prints 5 now!!
p fruits  # array got resized, first 3 elements were removed and replaced by just one with "blackberry"!!!

## .length and .size do same thing for array, i.e., give number of elements in it
# .size is normally more efficient as per documentations
# .count with no arguments works same as .length or .size
# .count with arguments can do more things
nums = [1, 2, 3, 4, 2, 3, 2, nil]
p nums.count  # prints 8, same as nums.length or nums.size
p nums.count(2) # counts number of time 2 appears in array, whcich is 3
p nums.count(nil) # number of times nil appear in array, which is 1

# One more example for above
booleans = [true, false, false, true, true, false, false, nil, true]
p booleans.count(false) # prints 4, the number of times false appear in array

# .empty? and .nil? methods
p [1, 2, 3].empty?  # prints false
p [].empty? # prints true
p [nil].empty?  # prints false since nil is also an object and array has one
p nil.nil?  # will return true. .nil? can be used to check if an object is nil

# .first and .last methods on an array
arr = [1, 3, 5, 7, 9, 15, 21, 18, 6]
p arr.first # prints 1 as Fixnum / Integer
p arr.last  # prints 6 as Fixnum / Integer
p arr.first(2)  # prints an array with first 2 elements of arr: [1, 3]
p arr.last(3) # prints an array with last 3 elements of arr: [21, 18, 6]
p arr[1]  # prints an array with first element of arr: [1]

## The .push method, the Shovel operator, and the .insert method:
locations = ["San Jose", "Sunnyvale"]
locations.push("Santa Clara") # adds new element at the end of array
p locations # prints ["San Jose", "Sunnyvale", "Santa Clara"]
locations.push("Los Gatos", "Mountain View")
p locations # prints array with 2 new elements added at the end
# There is a shortcut for push method:
locations << "Palo Alto" << "Fremont" # Shovel operator!
p locations # ["San Jose", "Sunnyvale", "Santa Clara", "Los Gatos", "Mountain View", "Palo Alto", "Fremont"]
# Note that above two ways mutate the original array
# .insert method: let's reset locations array to its original
locations = ["San Jose", "Sunnyvale"]
# Adds new elements begining from index 1 and pushes rest of them originally present to right
locations.insert(1, "Oakland", "San Ramon", "Pleasenton")
p locations # ["San Jose", "Oakland", "San Ramon", "Pleasenton", "Sunnyvale"]

## .pop method pops last element and returns it. It removes that element from array
last_item = locations.pop # removes last element of array
p last_item # prints "Sunnyvale"
last_items = locations.pop(2)  # removes last 2 elements and returns that as an array
p last_items  # returns array: ["San Ramon", "Pleasenton"]
p locations # locations array now looks like: ["San Jose", "Oakland"]

## .shift method works similar to .pop method except it operates at begining of array
nums = [1, 2, 3, 4, 5, 6]
first_element = nums.shift  # removes first element from nums and returns
p first_element # prints 1
p nums  # original array now looks like: [2, 3, 4, 5, 6]
first_few_elements = nums.shift(3)  # removes first 3 elements and returns array
p first_few_elements  # prints [1, 2, 3], the extracted elements array
p nums  # original array now looks like: [5, 6]

## .unshift works similar to push but at the begining of the array
# it basically inserts elements at the begining
nums.unshift(4)
p nums  # now prints [4, 5, 6]
nums.unshift(1, 2, 3)
p nums  # now becomes [1, 2, 3, 4, 5, 6]

## Compare arrays
a = [1, 2, 3]
b = [1, 2, 3, 4]
c = [3, 2, 1]
d = [1, 2, 3]
p a == b  # prints false. sizes is not same
p a == c  # prints false. sizes same but elements are different
p a == d  # prints true. size is same and elements are also same at respective indices
p a != c  # prints true
# Rememeber, unlike Java, objects can be different for them to be equal in Ruby!
# Same is the case with strings as well
# Equal arrays have to have same size and equal objects at corresponding indices!

## Spaceship Operator: <=> to compare arrays
# Arrays are compared by number of elements, then the corresponding elements
# Also, corresponding elements  are compared first before sizes are checked
# if left is higher, result is 1
# if right is higher, result is -1
# both arrays are same, result is 0
# if elements are not comparable (different objects), result is nil
#
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr3 = [2, 1, 3]
arr4 = [2, 1]
arr5 = [nil, "", 4, "rabbit"]
arr6 = [1, 2, 3, 4]
arr7 = ["cat", "dog", "elephant"]
arr8 = ["can", "dig", "elegant"]
p arr1 <=> arr2 # prints 0
p arr1 <=> arr3 # prints -1
p arr4 <=> arr2 # prints 1 since first element itself is higher
p arr5 <=> arr3 # prints nil since different objects
p arr1 <=> arr6 # prints -1, all elements are same but arr6 has more elements
p arr7 <=> arr8 # prints 1, "t" of "cat" is higher than "n" of "can"

## Convert Ranges to Arrays with the .to_a method:
arr1 = (3..5).to_a
arr2 = ("a".."e").to_a
arr3 = ("A"..."P").to_a
arr4 = ("A".."P").to_a
p arr1  # prints [3, 4, 5]
p arr2  # prints ["a", "b", "c", "d", "e"]
p arr3.length # prints 15
p arr4.length # prints 16, since 2 dots Range

## The .is_a? Predicate method
puts "\nThe .is_a? Predicate Method:"
p 1.class # Fixnum
p 3.14.class  # Float
p 99999999999999999999999999999999999999.class  # Bignum
p true.class  # TrueClass
p false.class # FalseFlass
p nil.class # NilClass
p [1, 2, 3].class # Array
p "Hello".class # String
puts
p 1.is_a?(Fixnum)  # prints true
p 1.is_a?(Integer)  # prints true
p 3.14.is_a?(Array)  # False
p [1, 2, 3].is_a?(Array)  # true

alphabets = ("a".."z").to_a
p alphabets.is_a?(Array)  # prints true

if alphabets.is_a?(Array) # you can verify the type and then proceed!
  alphabets.each {|e| print e + " "}
end
puts "\n\n"

### Class Hierarchy in Ruby ###
# Very top of class hierarchy in Ruby is: BasicObject
# Object derives from BasicObject
# Then comes various types of Object mentioned above.
# Integer class is inherited from Object class.
# Fixnum and Bignum are both inherited from Integer class
# Similarly, other types are also derived from Object Class
# So if we do below, all 3 statements will be true:
p "[1, 2].is_a?(BasicObject): #{[1, 2].is_a?(BasicObject)}"
p "[1, 2].is_a?(Object): #{[1, 2].is_a?(Object)}"
p "[1, 2].is_a?(Array): #{[1, 2].is_a?(Array)}"
