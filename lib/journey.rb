require_relative 'oystercard'

class Journey

  attr_reader :current_journey

def initialize
  @current_journey = {  entry: nil, exit: nil}
end

  def start_journey(station)
    @current_journey[:entry] = station
  end

  def end_journey(station)
    @current_journey[:exit] = station
  end

  def fare
    return Oystercard::PENALTY_FARE if (@current_journey[:exit] == nil && @current_journey[:entry] != nil) || @current_journey.values.include?(nil)
    Oystercard::MINIMUM_FARE
  end

 # def in_journey?
 #   return true if @current_journey[:entry] != nil && @current_journey[:exit] == nil
 #   false
 # end

end
