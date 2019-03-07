# Instance variables in Classes begin with a special char @ called sigil, this
# denotes variable scope. They belong to an object instance of a class.
# Example: @name
# Without @ symbol, a variable will be interpreted as local variable to the method
# it is used in.

class Gadget

  # Below provides getter and setter methods to variables you need it.
  # attr_accesor can be used to specify both getter and setter for an instance variable
  # Getters will be "attribute_name" and setters will be "<attribute_name>="
  attr_reader :username, :production_number
  attr_writer :username, :password

  # initialize method is like "constructors" in Java with special name "initialize"
  # given to it for all classes in Ruby. Notice here, with @ symbol prefixed
  # to these variables, they become accessible throughout the class!
  def initialize(user_name, password)
    @username = user_name
    @password = password
    @production_number  = "#{("a".."z").to_a.sample}-#{rand(1..999)}"
  end

  # Since we provided attr_reader and attr_writer above, we don't need to
  # provide these methods here:
  # def username
  #   @username
  # end
  #
  # def username=(user_name)
  #   @username = user_name
  # end
  #
  # def production_number
  #   @production_number
  # end

  # Instance methods. You will need to instantiate your class before calling to_s
  # Gadget.to_s will cause an error!
  # We're overriding the Object's to_s method here:
  def to_s
    # Must refer an instance variable with @ prefix!
    "Gadget with production_number: #{@production_number} belongs to "
    .concat("user #{@username} as part of #{self.class} class instance with ")
    .concat("Object_id: #{self.object_id}.")  # self keyword is like "this" in Java
  end
end

shiny = Gadget.new("SomeUser", "NoPassword")
flashy = Gadget.new("AnotherUser", "WeirdPassword")

# IDs will be different:
p shiny.object_id
p flashy.object_id

phone = Gadget.new("Ashesh", "topsecret")
laptop = Gadget.new("David", "won'ttellya")

# Will print like: <Gadget:0x007fa0738b81c8 @username="User-29", @password="topsecret",
# @production_number="c-244">
puts phone.inspect

p phone.instance_variables  # prints [:@username, :@password, :@production_number]

# There are many methods on Gadget, most of it inherited from Object class:
p Gadget.methods.length # prints 101 (in my code, things can vary later)
# a Diff in arrays from Object.methods and Gadget.method should return our method we provided:
p Object.methods - Gadget.methods # prints [] since to_s is already in Object that we overrode

# prints like: "Gadget with production_number: q-376 belongs to user User-45."
p "phone.to_s: #{phone.to_s}"
# prints like: "Gadget with production_number: i-582 belongs to user User-74."
p "laptop.to_s: #{laptop.to_s}"

# Call getter methods on Gadget
p phone.username  # "User-8"
p phone.production_number # "User-85"
p laptop.username # "User-75"
p laptop.production_number  # "e-555"

# Call setter on Gadget
phone.username=("David")
laptop.username=("Singh")
p phone.username  # "Ashesh"
p laptop.username  # "Singh"

# With attr_reader / attr_writer added to class, even this will work:
phone.username = "Jessi"
p phone.username  # prints "Jessi"
