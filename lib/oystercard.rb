class Oystercard

attr_reader :balance
MAXIMUM_BALANCE = 90

  def initialize
   @balance = 0
end

def top_up(amount)
  raise 'Maximum balance of 90 reached' if @balance + amount > MAXIMUM_BALANCE
  @balance += amount


end

end
