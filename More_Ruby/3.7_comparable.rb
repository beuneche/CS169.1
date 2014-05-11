class Account
  include Comparable
  def <=>(other)
    self.balance <=> other.balance
  end
end

dave > armando
