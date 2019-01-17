require_relative 'oystercard'

class Journey

  attr_reader :entry_station, :list_journeys


def initialize

  @entry_station = nil
  @list_journeys = []
end

  def start_journey(station)
    if @entry_station
      @entry_station = station
      raise "You didnt touch out"
    end
      @entry_station = station
  end

  def end_journey(exit_station)
    raise "You didnt touch in" if @entry_station == nil
    save_journey(@entry_station, exit_station)
    @entry_station = nil
  # @current_journey[:exit] = station
  end

  def save_journey(station1, station2)
    @list_journeys << {entry: station1, exit: station2}
  end

  def fare
    #return Oystercard::PENALTY_FARE if (@current_journey[:exit] == nil && @current_journey[:entry] != nil) || @current_journey.values.include?(nil)
    Oystercard::MINIMUM_FARE
  end

 # def in_journey?
 #   return true if @current_journey[:entry] != nil && @current_journey[:exit] == nil
 #   false
 # end
end
