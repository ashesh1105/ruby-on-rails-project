class Bicycle
  ### Class variables are only accessible via <class_name>. notation and not
  ## accessible via its instances. Must be prefixed by @@ !!
  # There's hence, just one copy of class variables avaialble as opposed to
  # instance variables which are private to an instance of the class:
  @@maker = "BikeTech"
  @@count = 0

  ### A class method is only accessible via its Class and not via its instances.
  ## Must be prefixed by either self keyword or class name itself. self is more
  # preferred shortcut:
  def self.description
    "Hi there, I am the blueprint of Bicycle, use me to create as
    many Bicycle as you want!"
  end

  def self.count
    @@count
  end

  # Let's allow class variable @@maker to be accessed by instances of Bicycle.
  # So here, we will not prefix method name by self:
  def maker
    @@maker
  end

  # Notice, we aren't providing any instance level getter for @@count!

  # Let's add initialize method, which is called every time an object gets
  # instantiated from this class, to increment count class variable:
  def initialize
    @@count += 1
  end
end

puts Bicycle.description # prints: Hi there, I am the blueprint of Bicycle,
# use me to create as many Bicycles as you want!

# Below code won't work till we expose our class variables:
p Bicycle.count

# maker class variable does has an instance method, so we can access it that way:
a = Bicycle.new
p a.maker

## Since initalize instnce method is added to class, we can see count getting
# incremented each time an instance gets created:
b = Bicycle.new
c = Bicycle.new
d = Bicycle.new

# With instances, a, b and c and d created, we should see class variable @@count
# incremented to 4 now:
p Bicycle.count # prints 4 !!
