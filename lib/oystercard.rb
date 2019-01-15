class Oystercard

attr_reader :balance
MAXIMUM_BALANCE = 90

  def initialize
   @balance = 0
end

def top_up(amount)
  maximum_balance = MAXIMUM_BALANCE
  raise "Maximum balance of #{maximum_balance} reached" if @balance + amount > MAXIMUM_BALANCE
  @balance += amount


end

end
