module Announcer
  def who_am_i
    "The name of this class is #{self}"
  end
end

class Dog
  extend Announcer
end

class Cat
  extend Announcer
end

## Since we extend Announcer in Dog and Cat classes, the method in Annouce module
# can not be accessed by Instances of Dog and Cag, we will have to call them
# via the class itself:
p Dog.who_am_i  # prints: "The name of this class is Dog"
p Cat.who_am_i  # prints: "The name of this class is Cat"

# It will throw undefined method error if we try to do these:
# Dog.new.who_am_i
# Cat.new.who_am_i
