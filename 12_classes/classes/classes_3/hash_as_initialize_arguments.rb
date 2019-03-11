## When there are too many arguments to send to initialize method to create an
# object, best practice is to accept a hash and initialize objects from that:
class Candidate
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  # Set defulat for details, so objects can still be created without details:
  def initialize(name, details={})
    ## We can provide our own default in case some keys are missing from hash
    # sent. The we can merge this with hash sent, so any missing keys in hash
    # sent will be replaced by our defalt. We will use bang version of merge
    # method here so the hash sent (details) is actually altered:
    defaults = {
      age: 35, occupation: "Candidate", hobby: "Running", birthplace: "USA"
    }
    defaults.merge!(details)
    @name = name
    @age = defaults[:age]
    @occupation = defaults[:occupation]
    @hobby = defaults[:hobby]
    @birthplace = defaults[:birthplace]
  end
end

info = {
  age: 53,
  occupation: "Banker",
  hobby: "Fishing",
  birthplace: "San Jose"
}
senator = Candidate.new("Mr Smith", info)
puts "senator:"
p senator.name
p senator.age
p senator.occupation
p senator.hobby
p senator.birthplace

# When we provide hash directly as argument to new:
counsellor = Candidate.new("Mrs Smith", { age: 57, occupation: "Clerk"})
# We can omit come key-value pairs and object will still be created with those
# attributes as null.

# Also, curly braces in above case can be omitted:
counsellor = Candidate.new("Mrs Smith", age: 57, occupation: "Clerk")
# Above is a common practice.

# With details.merge!(defaults) code in initialize method, we get default for
# the keys we don't pass in our hash:
puts
puts "counsellor:"
p counsellor.name
p counsellor.age
p counsellor.occupation
p counsellor.hobby
p counsellor.birthplace
