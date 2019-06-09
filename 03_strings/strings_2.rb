## .split method
# Splits a string based on supplied delimiter. Default is space
word = "I am so keen to lean Ruby!"
# No delimiter supplied so takes space as delimiter
word_arr = word.split
p word_arr  # prints ["I", "am", "so", "keen", "to", "lean", "Ruby!"]

## longest word exercise
# Write a method to find the longest word in given string input
def longest_word(sentence)
  result = ""
  sentence.split.each do |word|
    if word.length > result.length
      result = word
    end
  end
result
end

input = "Bobby loves kangaroos which are big and scary"
p longest_word(input) # prints "kangaroos"

### Iterate over chars of string: .each_char method:
# prints each char with a space in between:
"Hello world!".each_char {|char| print char + " "}
# You can achieve the same by split method as well giving empty string as
# delimiter! Output from below will be exactly same!
puts "\n.each_char and .split with empty string argument will do same work!"
"Hello world!".split("").each {|char| print char + " "}

## .join method is opposite of .split method:
puts "\n.join method is exactly opposite of .split method on String!"
arr = ["I", "need", "to", "learn", "Ruby", "asap!"]
p arr.join(" ") # prints "I need to learn Ruby asap!"

## .count method returns sum of number of occurrences of characters of a given
# substring on which this method is applied
str = "1111abc2222abc3333abc4444abc5555"
# Note that .count is total of how many times each character in the given
# substring appears in input string and not exactly the count of substring
# itself in input string. For example, in below example, it will give
# the sum of number of times letters a, b and c individually appear in input
# string. Also, order of letters in argument substring does not matter.
p str.count("abc")  # prints 12
p str.count("a")  # prints 4
p str.count("b")  # prints 4
p str.count("c")  # prints 4

## .index and .rindex methods in String:
# .index(substring) or .index(substring, index_position) gives
# first occurrence of given substring in input string
p "hello".index("l")  # prints 2
p "hello world".index("o", 5) # prints 7

# .rindex is reverse index, rindex(substring) or rindex(substring, index_position)
# gives index of first occurrence of substring in input string begining from end
p "hello world!".rindex("o") # prints 7, index of first "o" from end
p "hello world".rindex("o", 6)  # pritns 4, index of first "o" from end before
# given index 6!

## .insert method on a string.
# Format: String.insert(index, substring). It does mutate the original string!!
typo = "GeorgWashington"  # intentionally mssing "e" and space at index 5 and 6
p typo.insert(5, "e ")  # prints "George Washington"
# Can use negative index too:
typo = "George Washingto" # missing "n" at the end
typo.insert(-1, "n")
p typo  # prints "George Washington"

## .squeeze method:
# removes any char that appear more than once consecutively in a string
# once its done, a char can occur later in string
# but not repeat right there more than once!
word = "Oncee uppon   a tiiiime there  was aaa lion"
p word.squeeze  # prints "Once upon a time there was a lion
p word  # prints original sentence, so squeeze does not mutate original string!
# By default, squeeze focusses on every chars but we can tell it to focus on
# a char of substring to remove consecutive duplicates
# For example, below will remove extra spaces between words
p word.squeeze(" ") # prints: "Oncee uppon a tiiiime there was aaa lion"

## .clear method on a String. Clears a string content and makes it empty string!
# This method does mutate original string. No bang version needed!
word = "goodbye"
p word  # prints "goodbye"
p word.clear  # prints ""

## .delete removes all the characters we specify from a string
# This method does not mutate original string. Use bang version for that.
# if supplied char(s) are not part of string, it gives back original string.
str = "a word can be very important!"
p str.delete("a") # prints " word cn be very importnt!"
p str.delete(" ") # prints "awordcanbeveryimportant!"
