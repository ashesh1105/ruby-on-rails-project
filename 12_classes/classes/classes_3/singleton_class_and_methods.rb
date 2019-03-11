#### If we define a new method or override an existing one on a particular
### object, then that method is called singleton method and Ruby behind the
## scene creates an anonymouns class that inherits from the class to which this
# object belongs to. That object can then call that defined new or overridden
# method and get that functionality. No other objects can do that!
class Player
  def play_game
    rand(1..100) > 50 ? "Winner" : "Loser"
  end
end

dan = Player.new
bob = Player.new

p dan.play_game # Randomly prints Winner or Loser
p bob.play_game # Randomly prints Winner or Loser

# Let's now override a method on dan, so only dan will have it:
def dan.play_game
  "Winner"
end

p dan.play_game # This now, will always print "Winner", we "rigged" it here!
p bob.play_game # Randomly prints Winner or Loser

p dan.singleton_methods # prints [:play_game]
p bob.singleton_methods # prints empty array

p dan.singleton_class # prints anonymouns class
