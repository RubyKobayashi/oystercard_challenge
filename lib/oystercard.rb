require_relative 'journey'

class Oystercard

attr_reader :in_use, :balance, :list_journeys
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1
PENALTY_FARE = 6

  def initialize
   @balance = 0
   @list_journeys = []
   @journey = Journey.new
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

    deduct(@journey.fare)
    @journey = Journey.new
    @journey.start_journey(station)
  end

  def touch_out(station)
     @journey.end_journey(station)
     @list_journeys << @journey.current_journey
     deduct(@journey.fare)
  end

end
