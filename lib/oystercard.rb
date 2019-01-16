class Oystercard

attr_reader :in_use, :balance, :entry_station
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 2

  def initialize
   @balance = 0
   @in_use = false
  end

  def top_up(amount)
  maximum_balance = MAXIMUM_BALANCE
  raise "Maximum balance of #{maximum_balance} reached" if @balance + amount > MAXIMUM_BALANCE
  @balance += amount
  end


  def deduct(amount)
  @balance -= amount
  end


  def touch_in(station)
  fail "insufficient funds" if @balance < MINIMUM_BALANCE
  @in_use = true
  @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
  @in_use = false
  @entry_station = nil
  end

  def in_journey?
  @in_use
  end

end
