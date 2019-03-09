#### Very important and useful concept in Ruby! Monkey Patching allows you to
### add or override any new functionality in a class. Ruby is so flexible that
## it allows you to do it with built in classes as well, like Array or String!!!

#### Monkey Patching with built-in Array class:
class Array
  # Adding this new method in Array class that doesn't exist out-of-box.
  # It'll allow getting sum of numerica elements of an array, non-numeric
  # elements will be ignored:
  def sum
    total = 0
    self.each { |elem| total += elem if elem.is_a?(Numeric) }
    total
  end
end

p "Monkey Patching example with built-in Array class:"
# You can call any method available in Array class and now also call:
p [1, 2, 3].sum # prints 1+2+3 = 6
p [4, "A", 3, "abc", 8].sum # prints 4+3+8 = 15. Ignores non-numeric elements


#### Monkey Patching with built-in String class:
class String
  # Adding this new method in String class that doesn't exist out-of-box. It
  # will compute sum of alphabets assuming a=1, b=2..z=26. Solution will be
  # case insensitive, i.e, will work for lower as well as upper case alphabets.
  # Also, non alphabet characters will be ignored from the given String:
  def alphabet_sum
    sum = 0
    alphabet = ("a".."z").to_a
    self.downcase.each_char do |char|
      if alphabet.include?(char)
        sum += alphabet.index(char) + 1
      end
    end
    sum
  end
end

puts
p "Monkey Patching example with built-in String class:"
# You can call any method available in String class and now also call:
p "abcd".alphabet_sum # prints 1+2+3+4 = 10
p "ABCD".alphabet_sum # prints 1+2+3+4 = 10. Implemented as case insensitive
p "a4%%5b67c8e".alphabet_sum  # ignores non-alphabets and prints 11!


#### Monkey Patching with built-in Hash class:
class Hash

  def find_duplicate_value
    values = []
    dups = []
    self.each_value do |value|
      values.include?(value) ? dups << value : values << value
    end
    dups.uniq
  end
end

puts
p "Monkey Patching example with built-in Hash class:"
my_hash = {
  a: 100,
  b: 20,
  c: 30,
  d: 100,
  e: 26,
  f: 37,
  g: 30
}
# You can call any method available in Array class and now also call:
p my_hash.find_duplicate_value  # prints [100, 30] !!


#### Monkey Patching with build-in Integer method:
puts
p "Monkey Patching example with built-in Hash class:"
# To add time, say, 10 days to one time instance we need to convert that time
# unit to Seconds since + method on Time takes only Second, right?:
p Time.now  # prints current date and time
p Time.now + 10*24*60*60   # prints 10 days later date and time
# How about make this a bit simpler by Monkey Paching? :)
class Integer
  def seconds
    self
  end

  def minutes
    self * 60
  end

  def hours
    self * 60 * 60
  end

  def days
    self * 24 * 60 * 60
  end
end

p Time.now + 10.days  # prints time and date 10 days later!
sometime = Time.new(2019, 01, 01)
p sometime  # prints 2019-01-01 00:00:00 +/-<your_GMT_offset>
p sometime + 5.days # prints 2019-01-06 00:00:00 +/-<your_GMT_offset>
p sometime + 10.hours # prints 2019-01-01 10:00:00 +/-<your_GMT_offset>
p sometime + 50.minutes # prints 2019-01-01 00:50:00 +/-<your_GMT_offset>
# Super cool, isn't it? :)
