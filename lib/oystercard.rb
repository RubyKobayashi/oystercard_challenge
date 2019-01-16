class Oystercard

attr_reader :in_use, :balance, :list_journeys, :current_journey
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 2

  def initialize
   @balance = 0
   @list_journeys = []
   @current_journey = {}
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
  
  @current_journey = { entry: station, exit: nil }
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
     @current_journey[:exit] = station
     @list_journeys << @current_journey

  end

  def in_journey?
  return true if @current_journey[:entry] != nil && @current_journey[:exit] == nil
  false
  end

end
