module Purchasable
  def purchase(item)
    "#{item} has been purchased!"
  end
end

class Bookstore
  include Purchasable
end

class Supermarket
  include Purchasable
end

# Let's have one class inherit from above Class. Like "extends" in Java
class CornerMart < Supermarket
end

class SportsMart < Supermarket
  def purchase(item)
    "#{item} has been purchased from SportMart and we thank you for that!"
  end
end

barnes_and_noble = Bookstore.new

puts "include demo:"

# Below is possible just because Purchasable is included in Bookstore class,
# otherwise, as you can see Bookstore class does not has any methods yet!
p barnes_and_noble.purchase("Ruby Examples")  # "Ruby Examples has been purchased!"

# Similarly, you can call methods from instances of other Classes too:
walmart = Supermarket.new
p walmart.purchase("Cookies") # prints: "Cookies has been purchased!"

# CornerMart is not including Purchasable but it is extending from Supermarket
# which is including Purchasable, so purchase method can be called on an instance
# of CornerMart as well!!
quickstop = CornerMart.new
p quickstop.purchase("Slim Jim")  # prints: "Slim Jim has been purchased!"

# Notice here, SportsMart extends Supermarket which includes Purchasable but
# this class is overriding purchase method, so its own purchase method is called
# when we try to call it from one of its instances:
big5 = SportsMart.new
# prints: "Swim Ware has been purchased from SportMart and we thank you for that!"
p big5.purchase("Swim Ware")  # prints: "Slim Jim has been purchased!"


#### include Enumerable, a built-in Ruby module that can be included in your
### clss to add interation functionalities!
## https://ruby-doc.org/core-2.6.1/Enumerable.html
# The Enumerable mixin provides collection classes with several traversal and
# searching methods, and with the ability to sort. The class must provide a
# method each, which yields successive members of the collection. If
# Enumerable#max, #min, or #sort is used, the objects in the collection must
# also implement a meaningful <=> operator, as these methods rely on an ordering
# between members of the collection:
class ConvenienceStore
  include Enumerable

  attr_reader :snacks

  def initialize
    @snacks = []
  end

  def add_snack(snack)
    @snacks.push(snack)
  end

  def each
    @snacks.each do |snack|
      yield snack
    end
  end
end

puts "\nEnumerable demo:"

bodega = ConvenienceStore.new
bodega.add_snack("Kurkure")
bodega.add_snack("Chips Salasa")
bodega.add_snack("Haldiram")

bodega.each { |snack| p "Snack #{snack} is delicious!"}

# We are able to call below methods on an instance of our class ConvenienceStore
# becuase class included Enumerable which has these methods and we told Ruby
# to apply these methods on snacks array instance variable of ConvenienceStore
# by overriding each method in it:
p bodega.all? {|snack| snack.length > 5 } # prints true
p bodega.any? {|snack| snack.length > 20 }  # prints false
# prints: ["Delicious Kurkure", "Delicious Chips Salasa", "Delicious Haldiram"]
p bodega.map {|snack| "Delicious " + snack }
p bodega.select {|snack| snack.downcase.include?("ram")}  # prints ["Haldiram"]
p bodega.reject {|snack| snack.downcase.include?("ram")}  # ["Kurkure", "Chips Salasa"]
p bodega.sort # ["Chips Salasa", "Haldiram", "Kurkure"]
p bodega.first  # prints "Kurkure"
# Like above, all of 50+ methods we have available now in ConvenienceStore Just
# because we included Enumerable and overridden each method that module needed!
