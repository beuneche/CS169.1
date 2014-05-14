class Dessert
  attr_accessor :name
  attr_accessor :calories
  def initialize(name, calories)
    @name = name
    @calories = calories

  end
  def healthy?
    calories < 200
  end
  def delicious?
    flavor = name.split(" ")
    flavor[0] != "licorice"
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    @flavor = flavor
    super(flavor + " jelly beans", 5)
  end
end

dessert = JellyBean.new("licorice")
puts dessert.delicious?

