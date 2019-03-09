#### We can, off course, Monkey Patch our own custom classes too:

class Book
  def initialize(title, author, pages)
    @title = title
    @author = author
    @pages = pages
  end
end

# Let's Monkey Patch Book class now:
class Book
  def read
    # Check step function in code: ruby_basics_nums_booleans.rb in this project
    # It takes max_num and increment and a block, provides current "step" there
    1.step(@pages, 10) {|page| puts "Reading pages #{page}.."}
    puts "Done! #{@title} was a great book!"
  end
end

goosebumps = Book.new("Night of the Living Dummy", "R.L. Stine", 100)
p goosebumps # prints:
#<Book:0x007f90e10b46d0 @title="Night of the Living Dummy",
# @author="R.L. Stine", @pages=100>

puts
puts "Custom class Monkey Patching demo:"
animal_farm = Book.new("Animal Farm", "George Orwell", 50)
p animal_farm # this will work as usual
# Let's call our custom method on Book now:
animal_farm.read  # prints:
# Reading pages 1..
# Reading pages 11..
# Reading pages 21..
# Reading pages 31..
# Reading pages 41..
# Done! Animal Farm was a great book!

## Also note that any instances defined before class is Monkey Patched, also
# gets this extra functionality, for example, goosebumps:
goosebumps.read # prints:
# Reading pages 1..
# Reading pages 11..
# Reading pages 21..
# Reading pages 31..
# Reading pages 41..
# Reading pages 51..
# Reading pages 61..
# Reading pages 71..
# Reading pages 81..
# Reading pages 91..
# Done! Night of the Living Dummy was a great book!

# So care should be taken to not break the instances already created while
# Monkey Patching a class, especially if you are overriding an exisitng method!
