# Module names must start with capital letter else you'll get an error!
module Circle
  def self.area(radius)
    (Math::PI * (radius ** 2)).round(2)
  end
end

# p Circle.area(10) # 314.159
