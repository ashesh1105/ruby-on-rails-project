# Case Statement. Its like switch in other languages.
food = "cauliflower"
result = ""
case food
when "chicken"
  result = "Love chicken!"
when "goat meat", "lamb"
  result = "If tender, goat can be amazing!"
when "shrimp"
  result = "Shrimps are great as light fry with spices and with soups too!"
when "eggs", "egg plant", "cauliflower"
  result = "Veggies are not bad either :)"
else
  result = "I don't know any other food :)"
end

puts result

# See another way of using Case statement:
# When results based on when statements are small enough, you can use then
# keyword and return result on same line
def calculate_school_grade(grade)
  case grade
  # Notice last statement becomes return result and usage of then keyword as well
  when 90..100 then "A"
  when 80..89 then "B"
  when 70..79 then "C"
  when 60..69 then "D"
  else "F"
  end
end

p "School Grade: #{calculate_school_grade(91)}"
p "School Grade: #{calculate_school_grade(83)}"
p "School Grade: #{calculate_school_grade(78)}"
p "School Grade: #{calculate_school_grade(61)}"
p "School Grade: #{calculate_school_grade(58)}"
p "School Grade: #{calculate_school_grade(29)}"

# Negation with !
if !2 # !<any_object_except_nil_or_false> == false !!
  puts "2 can NOT be made false by applying ! before it."
else
  puts "2 can be made false by applying ! before it."
end # will print: 2 can be made false by applying ! before it.

# Similar to above, !!1 or !!3.14 will be true and !nil or !false will be true!

# unless keyword, used where if <obj1> != <obj2>..
# Helps code read more like english
password = "dominos"
if password != "whiskers"
  puts "Not allowed!"
else
  puts "That's the right password, welcome!"
end
#
# Above if statement can be replaced by below using unless statement:
#
unless password == "whiskers" # read this as: if password != "whiskers"
  puts "Not allowed!"
else
  puts "That's the right password, welcome!"
end

# while loop is similar to other programming languages
i = 1
while i <= 10
  puts i
  i = i.next
end # prints 1 to 10

# until keyword is opposite of while loop, keeps executing until the condition is true
i = 1
until i >=5 # will print 1 till 4. Won't print 5 and more since conditon becomes true at i == 5
  print i
  print " "
  i += 1  # Note: ++ operator isn't available in Ruby, like no i++ here!
end

## Inline modifiers like Simplified if statement, etc:
puts "\nInline modifiers like simplified if statements, etc:"
interested = "yes"
# simplified if statement below. You don't need keyword 'end' in this:
puts "I am interested" if interested == "yes" # prints I am interested
# You can also write one line unless statements also similar to if statement above

## Conditional Assignment: ||=
# Assigns value to a variable if and only if it was nil. ||= is the operator.
# Comes handy when we want to assign a default value in case a variable is nil
# Example of conditional assignment situation:
word = "Hello"
index = 0
extracted_string = word[index]
# Let's say, out index was 100, extracted_string will come as nil in that case
index = 100
extracted_string = word[index]
p extracted_string  # will print nil
extracted_string ||= "Not found"
p extracted_string  # prints "Not found"
