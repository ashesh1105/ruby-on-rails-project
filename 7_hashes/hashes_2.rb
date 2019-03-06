### Create Hash with Default value:
## If a key doesn't exist, a Hash retuns nil object. If we want to change this
# behaviour and rather return a custom object, there are two ways of doing it:

# 1) Create Hash with new keyword and provide default right there:
my_hash = Hash.new("Not found")
my_hash[:k1] = "v1"
my_hash[:k2] = "v2"
my_hash[:k3] = "v3"
# Now if you look for a key :k4 that doesn't exist:
p my_hash[:k4]  # it will print "Not found"

# 2) Provide default after Hash is created. You can also change existing default:
my_hash_d = {
  k1: "v1",
  k2: "v2"
}
my_hash_d.default = "Key doesn't exist!"
# Now if you look for a key :k4 that doesn't exist:
p my_hash_d[:k3]  # it will print "Key doesn't exist!"

# You can change existing default too by above way:
my_hash.default = 0
# Now if you look for a key :k4 that doesn't exist:
p my_hash[:k4]  # it will print 0

### Convert Hash to an Array and vice versa:
## .to_a and .to_h methods demo:
my_arr = my_hash.to_a # convert hash to array
# Notice how Ruby creates sub arrays each for a key-value pair!
p my_arr  # prints: [[:k1, "v1"], [:k2, "v2"], [:k3, "v3"]]
p my_arr.class  # prints Array
# To convert an array to hash, you need to create a nested array with sub arrays
# that have key as first element and value as second. Notice we need to provide
# keys of Symbols in its usual way, i.e. colon before name, instead of shortcut
# syntax we use while creating Hashes from Symbols, <key_name>: <value>:
arr = [
  [:my_key1, 1],
  [:my_key2, 2],
  [:my_key3, 3]
]
my_hash_from_array = arr.to_h # create hash from array
p my_hash_from_array  # prints: {:my_key1=>1, :my_key2=>2, :my_key3=>3}
p my_hash_from_array.class  # prints Hash


### .sort and .sort_by methods on Hash:
## Ordering doesn't matter in Hashesh so Ruby converts Hash to an Array which
# is ideal to stored ordered data, and then sorts it. You can grab that resulting
# array by doing arr = hash.sort or arr = hash.sort.reverse
# Since ordering doesn't
pokemon = {
  squirtle: "Water",
  bulbasaur: "Grass",
  charizard: "Fire"
}
p pokemon # prints {:squirtle=>"Water", :bulbasaur=>"Grass", :charizard=>"Fire"}
# prints: [[:bulbasaur, "Grass"], [:charizard, "Fire"], [:squirtle, "Water"]]
p pokemon.sort  # sorted array of sub array for each key-value pair
# prints: [[:squirtle, "Water"], [:charizard, "Fire"], [:bulbasaur, "Grass"]]
p pokemon.sort.reverse
# As mentioned above, you can grab the resulting array which is sorted the way
# we need it, by keys:
arr = pokemon.sort
p arr   # prints same result as p pokemon.sort above, i.e. sorted array

# .sort_by method can help sort by values of hash as well
p pokemon.sort_by {|key, value| key }   # prints 2D array sorted by hash keys:
# [[:bulbasaur, "Grass"], [:charizard, "Fire"], [:squirtle, "Water"]]
p pokemon.sort_by {|key, value| value } # prints 2D array sorted by Hash values:
# [[:charizard, "Fire"], [:bulbasaur, "Grass"], [:squirtle, "Water"]]
# Below will print resulting 2D array reverse sorted by Hash values:
p pokemon.sort_by {|key, value| value }.reverse # prints:
# [[:squirtle, "Water"], [:bulbasaur, "Grass"], [:charizard, "Fire"]]
# You can apply .reverse on .sort_by key above as well.

### .key? and .value? predicate (or boolean) methods
## Note that .has_key? and .has_value? methods are deprecated so use above methods:
cars = {
  toyota: "camry",
  chevrolet: "aveo",
  ford: "F-150",
  kia: "soul"
}
# Look for keys:
p cars.key?(:ford)  # prints true
p cars.key?(:bmw) # prints false
# Keys are symbols here and not string, so:
p cars.key?("kia")  # prints false
p cars.key?(:kia) # prints true

# Look for values:
p cars.value?("F-150")  # prints true
p cars.value?("Prius")  # prints false


### If a method takes many arguments, it is a good idea to accept a hash with
## keys representing argument names. That will be less arror prone and caller
# will not have to remember the order of arguments to pass.

### .delete method on Hash:
## .delete method takes key to be deleted and returned the deleted value
removed = cars.delete(:ford)
p removed # prints "F-150"
# key value pair with key = :ford gone:
p cars  # prints {:toyota=>"camry", :chevrolet=>"aveo", :kia=>"soul"}


### .select and .reject methods on Ruby Hash:
## Concept is very similar to applying .select and .reject on Arrays:
recipe = {
  suger: 5,
  flour: 10,
  salt: 2,
  pepper: 4
}
# .select returns a new Hash with key-value pairs that satisfies given condition:
new_recipe_select_hash = recipe.select {|ingredient, teaspoon| teaspoon >= 5 }
p new_recipe_select_hash.class  # prints Hash
p new_recipe_select_hash  # prints {:suger=>5, :flour=>10}

# .reject method returns a new Hash with k-v pairs that doesn't satify
# given condition:
new_recipe_reject_hash = recipe.reject {|ingredient, teaspoon| ingredient.length <= 4 }
p new_recipe_reject_hash.class  # prints Hash
p new_recipe_reject_hash  # prints {:suger=>5, :flour=>10, :pepper=>4}


### .merge method takes one argument as another hash and merges the two hashes:
market = {
  garlic: "3 cloves",
  tomatoes: "5 batches",
  milk: "10 gallons"
}
kitchen = {
  bread: "2 loaves",
  yogurt: "20 cans",
  milk: "100 gallons"
}
new_kitchen_hash = market.merge(kitchen)  # merges market hash to kitchen hash
# Notice here, value for common key, :milk is retained from kitchen hash:
# prints: new_kitchen_hash: {:garlic=>"3 cloves", :tomatoes=>"5 batches",
# :milk=>"100 gallons", :bread=>"2 loaves", :yogurt=>"20 cans"}
puts "new_kitchen_hash: #{new_kitchen_hash}"

new_market_hash = kitchen.merge(market)   # merges kitchen hash to market hash
# Notice here, value for common key, :milk is retained from kitchen hash:
# prints: new_market_hash: {:bread=>"2 loaves", :yogurt=>"20 cans",
# :milk=>"10 gallons", :garlic=>"3 cloves", :tomatoes=>"5 batches"}
puts "new_market_hash: #{new_market_hash}"

# Also note that values of original hashes are unchanged:
# prints: market: {:garlic=>"3 cloves", :tomatoes=>"5 batches", :milk=>"10 gallons"}
puts "market: #{market}"
# prints: kitchen: {:bread=>"2 loaves", :yogurt=>"20 cans", :milk=>"100 gallons"}
puts "kitchen: #{kitchen}"
# If you want to change original hashes, use the bang version, i.e., .merge!

### Excercise on Hashesh:
## Code a method that accepts a string and returns a hash with keys as words
# in string and values as number of times that word appear in string:
def word_count(sentence)
  arr = sentence.split(" ")
  result = Hash.new(0)  # add default value as 0 for each new keys
  arr.each {|word| result[word] += 1 } # increment key 0 -> 1 -> 2..
  result  # last expression of a method is returned
end

result_hash = word_count("Once upon a time in a land far far far away")
p result_hash # prints: {"Once"=>1, "upon"=>1, "a"=>2, "time"=>1, "in"=>1,
# "land"=>1, "far"=>3, "away"=>1}
