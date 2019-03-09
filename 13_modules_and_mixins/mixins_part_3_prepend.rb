module Purchasable
  def purchase(item)
    "#{item} has been purchased!"
  end
end

class Bookstore
  # Replaced include from prepend, so common method(s) from Purchasable will
  # take precedence over the ones defined in this class!
  prepend Purchasable

  def purchase(item)
    "You bought a copy of #{item} at the bookstore!"
  end
end

# Notice how the order changes from Bookstore -> Purchasable to Prachasable -> Bookstore
# as we changed "include Purchasable" to "prepend Purchasable" in class above!
p Bookstore.ancestors # [Purchasable, Bookstore, Object, Kernel, BasicObject]
barnes_and_noble = Bookstore.new
# Below will print the method from Purchasable instead of from Bookstore!
p barnes_and_noble.purchase("Quite")  # prints "Quite has been purchased!"
