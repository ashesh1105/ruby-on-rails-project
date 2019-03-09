## Modules are enclosed namespaces. Essentially tool-boxes that you can use
# over and again in your code whereever you need it. You can define your own
# constants and methods as well there which come handy in solving bigger problems.
# Module names must start with capital letter else you'll get an error!
module LengthConversions

  WEBSITE = "www.google.com"

  # self or Module name is needed here, else you'll get undefined method error!
  def self.miles_to_feet(miles)
    miles * 5280
  end

  def self.miles_to_inches(miles)
    inches = miles_to_feet(miles)
    inches * 12
  end

  def self.miles_to_centimeters(miles)
    inches = miles_to_inches(miles)
    inches * 2.54
  end
end

# puts LengthConversions.miles_to_feet(100) # prints 528000
# puts LengthConversions.miles_to_inches(200) # prints 12672000
# puts LengthConversions.miles_to_centimeters(300) #48280320.0
