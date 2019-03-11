#### Ruby allows Single Inheritance only, meaning a class can inherit from
### one superclass only. Similar to Java. < symbol is used for it.

class Employee

  attr_accessor :age
  attr_reader :name

  # Class variables must be initialized right there, else its an error!
  @@employee_count = 0

  def initialize(name, age)
    @name = name
    @age = age
    @@employee_count += 1
  end

  def introduce
    # We call getters name and age defined by attr_accessor and attr_reader
    "Hi, my name is #{name} and my age is #{age}."
  end

  # You need to use <self_or_class_name>.<method_name> to access a class
  # variables. So can't use regular method or attr_reader, attr_writer or
  # attr_accessor for them!
  def self.employee_count
    @@employee_count
  end
end

ashesh = Employee.new("Ashesh", 46)
p ashesh.introduce  # prints "Hi, my name is Ashesh and my age is 46."
puts ashesh.class # prints Employee

# Let's extend Employee now. < means class Manager is subclass of Employee
class Manager < Employee

  attr_reader :rank

  @@manager_count = 0

  ### Notice, Manager subclass defines its only constructor, the initialize
  ## method, so it has to call super to ensure that parent class, Employee,
  # gets name and age attributes. Then it can define its only instance variables
  # with @ prefix or even class variables with @@ prefix!
  # Also, Manager class will have to define getter and/or setters for new
  # attributes it is adding, like rank here:
  def initialize(name, age, rank)
    # initialize parent class. super calls appropriate initialize method there!
    # that will also increment @@employee_count in parent class since a Manager
    # is an Employee too:
    super(name, age)
    @rank = rank
    @@manager_count += 1
  end

  # Must use <self_or_class_name>.<method_name> to access class variables
  def self.manager_count
    @@manager_count
  end

  # Bad manager :)
  def yell
    "Who's is the boss? I'm the boss!"
  end

  # Override superclass method:
  def introduce
    # rank is a method (getter) call, not instance attribute reference.
    # Calling super will call introduce on parent class. That avoids duplicating
    # the code and add any additional stuff at child class (Manager):
    # Also note, there are 3 ways of calling super:
    # 1) with no paranthese, no argument: the situation below is an example.
    # 2) super(): paranthese but no argument. Needed if Child method takes
    #    arguments but parent one doesn't. In that case, since Ruby will pass
    #    arguemnt as well to Parent class (calls as such), it'll be an error.
    #    Empty paranthese with super will tell Ruby to call Parent corresponding
    #    method but not pass argument!
    # 3) super(arguments): If parent corresponding method takes argument, we
    #    need to pass it, as in initialize super method call in Manager class!!
    result = super
    # Now, let's modify results from parent's introduce method and return!!
    # You could do it in one line too: super + " I am also a #{rank}!"
    result + " I am also a #{rank}!"
  end
end

class Worker < Employee

  @@worker_count = 0

  def initialize(name, age)
    # initialize parent class. super calls appropriate initialize method there!
    # that will also increment @@employee_count in parent class since a Worker
    # is an Employee too.
    # Also, super below will pass all available arguments passed to this method,
    # to initialize method of parent class, so we don't need to do:
    # super(name, age) and just coding super will be fine here since we want
    # to pass both the parameters and no more, no less here: 
    super
    @@worker_count += 1
  end

  # Must use <self_or_class_name>.<method_name> to access class variables!
  def self.worker_count
    @@worker_count
  end

  def yell
    "A friendly suggestion, try to be a Manager, not a 'Boss' please!"
  end

  def clock_in(time)
    "Starting my shift at time #{time}."
  end
end

# Notice, you have to pass arguments for Manager and Worker objects too!
bob = Manager.new("Bob", 48, "Manager II")
dan = Worker.new("Dan", 36)

p bob.class # Manager
p bob.class.superclass  # Employee
p bob.class.ancestors # [Manager, Employee, Object, Kernel, BasicObject]

p dan.class # Worker
p dan.class.superclass  # Employee
p dan.class.ancestors # [Worker, Employee, Object, Kernel, BasicObject]

# Notice, how overridden method makes use of parent class method and then adds
# more to it. super automatically looks for same class name in parent class and
# brings in that data which child class method can then add / modify and return!
p bob.introduce # "Hi, my name is Bob and my age is 48. I am also a Manager II!"

# Class Worker did not override introduce method, so calls parent method:
p dan.introduce # "Hi, my name is Dan and my age is 36."

puts Manager < Employee # true
puts Employee < Worker  # false, Worker < Employee will be true!
puts Worker < Object  # true

p bob.is_a?(Manager)  # true
p bob.is_a?(Employee)  # true
p bob.is_a?(Object)  # true
p bob.is_a?(BasicObject)  # true
p bob.is_a?(Worker)  # false

p bob.instance_of?(Manager)  # true
p bob.instance_of?(Employee)  # false
p bob.instance_of?(Object)  # false
p bob.instance_of?(BasicObject)  # false
p bob.instance_of?(Worker)  # false

p bob.yell  # "Who's is the boss? I'm the boss!"
p dan.yell  # "A friendly suggestion, try to be a Manager, not a 'Boss' please!"

p dan.clock_in(Time.new.to_s) # "Starting my shift at time <current_date_time>"

## Test global counters for Employees, Managers and Workers:
# As you can see below, since we created 1 employee from Employee class,
# 1 Manager from Manager class that extends Employee (so, a Manager is also
# an employee), 1 Worker from Worker class (A Worker is also an Employee), so
# we have 3 Employees, 1 Manager and 1 Worker:
p "Employee.employee_count: #{Employee.employee_count}" # prints 3
p "Manager.manager_count: #{Manager.manager_count}" # prints 1
p "Worker.worker_count: #{Worker.worker_count}" # prints 1

# If we now create one more Manager and 1 more Worker:
shiela = Manager.new("Shiela", 43, "Manager I")
chris = Worker.new("Chris", 41)

# Now if we prints all three counters:
p "Employee.employee_count: #{Employee.employee_count}" # prints 5
p "Manager.manager_count: #{Manager.manager_count}" # prints 2
p "Worker.worker_count: #{Worker.worker_count}" # prints 2
