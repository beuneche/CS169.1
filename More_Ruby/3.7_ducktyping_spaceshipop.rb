class Card
  include Comparable
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def <=> (other) #1 if self>other; 0 if self==other; -1 if self<other
    self.value <=> other.value
  end

end

a = Card.new(7)
b = Card.new(10)
c = Card.new(8)

puts a > b # false
puts c.between?(a,b) # true

