class Olympic_Medal

  # This allow using operators: <, <=, >, >=, <=>, .between among its instances
  # We do need to override spaceship operator <=>, which we've done below in class
  # Allows us to compare objects in custom way! Similar to Java Comparable where we
  # override compareTo method. In Ruby <=> method that needs overriden!
  include Comparable

  MEDAL_VALUES = {
    "Gold" => 3,
    "Silver" => 2,
    "Bronze" => 1
  }

  attr_reader :type

  def initialize(type, weight)
    @type = type
    @weight = weight
  end

  # Must override this if including Comparable
  # This will allow custom comparision between objects of this class
  def <=>(other_medal)
    if MEDAL_VALUES[type] < MEDAL_VALUES[other_medal.type]
      -1
    elsif MEDAL_VALUES[type] > MEDAL_VALUES[other_medal.type]
      1
    else
      0
    end
  end
end

bronze = Olympic_Medal.new("Bronze", 5)
silver = Olympic_Medal.new("Silver", 10)
gold = Olympic_Medal.new("Gold", 3)

p gold > silver # true
p gold > bronze # true
p silver < gold # true
p bronze > silver # false
p bronze <= gold # true
p silver != gold # true
p silver.between?(bronze, gold) # true
