class Car

  def initialize(age, miles)
    base_value = 20000
    age_deduction = age * 1000
    miles_deduction = (miles / 10.to_f)
    # We only need this as instance variable
    @value = base_value - age_deduction - miles_deduction
  end

  # Notice since value getter method is made protected, one object of this class
  # say, civic can call value getter method on another object of same class,
  # say, ford (and vice versa)!
  def compare_car_with(car)
    self.value > car.value ? true : false
  end

  # This is how you make a method protected. It is not accesible to end users
  # even via an object of this class but one object of this class can call
  # these methods on another objects of same class!
  # So protected methods allow objects of same class to communicate each other,
  # but don't expose them to end user to call them, even via objects!
  protected
  attr_reader :value
end

civic = Car.new(3, 3000)
ford = Car.new(5, 2000)

# Below commented code should not work since value method is protected and
# get_car_value method is been made private!
# p civic.get_car_value
# p ford.get_car_value
# p civic.value

p civic.compare_car_with(ford)  # prints true
p ford.compare_car_with(civic)  # prints false
