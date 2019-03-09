require_relative "./app-store.rb"

class Gadget

  # Define getters and setters for instance variables
  # : is needed to be prefixed so Ruby knows you mean instance variables
  attr_reader :production_number, :apps  # getters only
  attr_accessor :username # getters and setters

  def initialize(user_name, password)
    @username = user_name
    @password = password
    @production_number  = generate_production_number
    @apps = []
  end

  # Allow password to be updated only if new_password confirms to rules:
  def password=(new_password)
    @password = new_password if validate_password(new_password)
  end

  def to_s
    # Must refer an instance variable with @ prefix!
    # Prefer instance methods over instance variables:
    # production_number and username have accessor methods and getter don't
    # even need to be referenced by self., so changed @production_number and
    # @username to simply production_number and username which will refer to
    # getter methods. Accessing instance variable directly tightly couples to
    # how we store them, getter methods are tailored to presenting them in right
    # way. Ruby is smart to also get object_id to mean self.object_id
    "Gadget #{production_number} has the username #{username}.
    It is made from the #{self.class} class and it
    has the ID #{object_id}"
  end

  # Validate app name sent and if there's a match, store it on user's device
  def install_app(name)
    app = AppStore.find_app(name)
    @apps << app unless app.nil? || @apps.include?(app)
  end

  def delete_app(name)
    app = @apps.find { |installed_app| installed_app.name == name }
    @apps.delete(app) unless app.nil?
  end

  def reset(username, password)
    # Below are actually method calls on setter methods password=, username=
    # and argument is passed to it. self.username = username means: call
    # setter method username= and pass the username that is provide right after
    # = sign in the syntax. This way, any validation functionality we provided
    # in say, password= method, etc, can be reused!
    # Also, if you see: self.username: there is not username field in this class
    # , we have @username, the instance variable. username is a shortcut for
    # username= which is a setter method for username!
    self.username = username
    self.password = password if validate_password(password)
    self.apps = []
  end

  # This is how you make a method in Ruby private. Any methods defined below
  # this line will not be accessible outside this class, including
  # any other class, objects or even by objects by its class!
  private

  # Password validation rules:
  # 1) Must be a String, 2, at least 6 characters, 3) has at least one digit:
  def validate_password(new_password)
    new_password.is_a?(String) && new_password.length >= 6 && new_password =~ /\d/
  end

  # Generates production number, which initializes @production_number
  def generate_production_number
    start_digit = rand(10000..99999)
    end_digit = rand(10000..99999)
    aphabet = ("A".."Z").to_a
    middle_digit = "2019"
    5.times { middle_digit << aphabet.sample }
    "#{start_digit}-#{middle_digit}-#{end_digit}"
  end
end

phone = Gadget.new("ashesh", "password123")
p phone.production_number
# There's however a problem, one can access generate_production_number method
# via an object of Gadget class, which is not what we want!
# So we'll change this method to private so below commented code should not work!
# p phone.generate_production_number

# Below won't go through due to validate_password method added to class
# phone.password = 123
# phone.password = "pwd"
# phone.password = "mypassword"

# But this will go through, since it is string, has 6 chars and has at least
# one digit, per the validate_password rules set in class. If you add
# :password with attr_reader line in class, below code can print the new
# password:
# p phone.password
# For security reasons, getter method for password is not provided.

phone.install_app(:Chat)
phone.install_app(:Weather)
phone.install_app(:Chat)  # should be ignored since already exists
# puts phone.apps # Should print:
#<struct AppStore::App name=:Chat, developer=:facebook, version=2.0>
#<struct AppStore::App name=:Weather, developer=:yahoo, version=10.15>
phone.install_app(:Twitter)
# puts phone.apps # should print:
#<struct AppStore::App name=:Chat, developer=:facebook, version=2.0>
#<struct AppStore::App name=:Weather, developer=:yahoo, version=10.15>
#<struct AppStore::App name=:Twitter, developer=:twitter, version=5.8>

phone.install_app(:Ashesh)  # no difference since doesn't exists in AppStore
puts phone.apps

# Test deleting some apps:
phone.delete_app(:Chat)
phone.delete_app(:Weather)

puts

# Finally, with :Chat and :Weather apps deleted, this should print :Twitter:
puts phone.apps # prints:
#<struct AppStore::App name=:Twitter, developer=:twitter, version=5.8>
