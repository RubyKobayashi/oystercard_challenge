require_relative 'journey'

class Oystercard

  attr_reader :in_use, :balance, :list_journeys
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
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
  
    begin
    @journey.start_journey(station)
    # deduct(@journey.fare)
    # @journey = Journey.new
  rescue StandardError
    deduct(PENALTY_FARE)
  end
  
    def touch_out(station)
      @journey.end_journey(station)
      deduct(@journey.fare)
      rescue StandardError
        deduct(PENALTY_FARE)
    end
  
  end
end
