#### Monkey Patching Integer again:
### We know if we do 3.times we can get iteration number starting from 0 to 2
## What if we want this to be from 1 to 3?
class Integer
  def custom_times
    i = 0
    while (i < self)
      yield(i + 1)  # 1, 2, 3, 4, 5 for 5.custom_times
      i += 1  # i++ not allowed in Ruby!
    end
  end
end

# we know:
3.times { |index| p index } # prints 0, 1, 2

puts
puts "Monkey Patching with Integer to provide custom_times method demo:"
3.custom_times { |index| p index }  # prints 1, 2, 3
