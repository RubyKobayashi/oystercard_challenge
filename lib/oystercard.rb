class Oystercard

attr_reader :in_use, :balance, :entry_station
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 2

  def initialize
   @balance = 0
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
  @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
  !!@entry_station
  end

end
