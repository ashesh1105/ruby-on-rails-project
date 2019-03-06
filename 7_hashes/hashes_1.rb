# Declare an empty map:
grades = {}
p grades.class  # prints Hash

# Populate map with data. Notice the Rocket (=>) operator
grades = {
  "David" => "A",
  "Susan" => "B",
  "Mohan" => "C",
  "Zizi" => "D"
}
# You can print entire Hash object:
p grades  # prints {"David"=>"A", "Susan"=>"B", "Mohan"=>"C", "Zizi"=>"D"}
# This is how you access individual key-value pairs in a Hash:
p grades["Susan"] # "B"
p grades["Zizi"]  # "D"


### Symbols as Hash Keys (:<variable_name>)
## Symbols are lightweight Strings
:name   # this is how you declare a symbol
p :name.class # prints Symbol
p :name.methods # prints all the methods available on Symbol class
p :name.methods.length  # prints 79, the number of methods present in Symbols class
p "name".methods.length # prints 170, the number of methods present in String class
# So it is obvious that Symbols are lightweight compared to Strings, hence
# they are better choice for Hash Keys compared to Strings!
person = {
  :name => "Shiela",
  :age => 35,
  :confident => true,
  :languages => ["Ruby", "Java", "JavaScript"]
}
p person[:name] # prints "Shiela"
p person[:age]  # prints 35
p person[:confident]  # prints true
p person[:languages]  # prints ["Ruby", "Java", "JavaScript"]
# There's a short hand syntax to declare Hashes with Symbols. With this syntax,
# colon comes at the end of variable name and no rocket operator (=>) needed:
person2 = {
  name: "Yulian",
  age: 39,
  confident: true,
  languages: ["Ruby", "Java", "JavaScript", "PHP"]
}
# You access hashes in same way as above:
p person2[:name] # prints "Yulian"
p person2[:age]  # prints 39
p person2[:confident]  # prints true
p person2[:languages]  # prints ["Ruby", "Java", "JavaScript", "PHP"]

### Convert Symbol to a String and vice versa
p :name.to_s.class  # prints String
p "address".to_sym  # prints :address
p :address.class  # prints Symbol

### .fetch method on Hash is like [] way of getting records with one key
## difference that when key not found, it returns an error or the string we
# provide to it as second argument:
menu = {
  burger: 3.99,
  taco: 5.96,
  chips: 0.5
}
p menu[:burger] # prints 3.99
p menu[:taco] # prints 5.96
p menu[:chips]  # prints 0.5
# Let's use fetch method now!
p menu.fetch(:burger)
p menu.fetch(:taco)
p menu.fetch(:chips)
# p menu.fetch(:pizza)  # this will return an error since :pizza does not exist in Hash
p menu.fetch(:pizza, "Not found") # prints our custom string "Not found"
p menu.fetch(:ashesh, "Not found")  # prints "Not found" since :ashesh doesn't exist in Hash

## Add new key-value pair to existing Hash. 2 Ways: Bracket symbol
# and .store method
menu[:pizza] = 8.99
p menu  # prints: {:burger=>3.99, :taco=>5.96, :chips=>0.5, :pizza=>8.99}
menu[:pasta] = 4.99
p menu # prints {:burger=>3.99, :taco=>5.96, :chips=>0.5, :pizza=>8.99, :pasta=>4.99}
# .store method:
menu.store(:sushi, 14.99)
menu.store(:chicken, 17.99)
p menu  # prints {:burger=>3.99, :taco=>5.96, :chips=>0.5, :pizza=>8.99,
# :pasta=>4.99, :sushi=>14.99, :chicken=>17.99}

## .length and .empty? methods on Hash
p menu.length # prints 7, number of key-value pairs in Hash
p menu.empty? # prints false since menu hash does has elements

### .each method on a Ruby Hash object:
menu.each {|key, value| p "key: #{key}, value: #{value}"} # prints as below:
# "key: burger, value: 3.99"
# "key: taco, value: 5.96"
# "key: chips, value: 0.5"
# "key: pizza, value: 8.99"
# "key: pasta, value: 4.99"
# "key: sushi, value: 14.99"
# "key: chicken, value: 17.99"
person.each do |k, v|
  p "key: #{k} : value: #{v}"
end # prints as below:
# "key: name : value: Shiela"
# "key: age : value: 35"
# "key: confident : value: true"
# "key: languages : value: [\"Ruby\", \"Java\", \"JavaScript\"]"

# Note that each key-value pair in hash can be seen as arrays of two elements.
# So we can also extract just the key or value by array[0] or array[1]:
person.each do |key_value_array|
  p key_value_array[0]
end # prints all the keys of hash as below:
# :name
# :age
# :confident
# :languages
person.each do |key_value_array|
  p key_value_array[1]
end # prints all the values of hash as below:
# "Shiela"
# 35
# true
# ["Ruby", "Java", "JavaScript"]

### The .each_key and .each_value Methods. Prefer this method over above one's!
salaries = {
  director: 100000,
  producer: 200000,
  ceo: 300000
}
salaries.each_key {|position| p "Position: #{position}"}  # prints:
# "Position: director"
# "Position: producer"
# "Position: ceo"
salaries.each_value {|salary| p "Salary: #{salary}"}  # prints:
# "Salary: 100000"
# "Salary: 200000"
# "Salary: 300000"

### .keys or .values methods on Hash:
p salaries.keys # prints [:director, :producer, :ceo]
p salaries.values  # prints [100000, 200000, 300000]
# if we need unique values, we can also do salaries.values.uniq
