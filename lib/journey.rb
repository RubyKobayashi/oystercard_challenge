require_relative 'oystercard'

class Journey

  attr_reader :entry_station, :list_journeys
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
  
    @entry_station = nil
    @exit_station = nil
    @list_journeys = []
  end

  def start_journey(station)
    # if user did not touch out
    if @entry_station
      @entry_station = station
      raise "You didnt touch out"
    end
    @entry_station = station
  end

  def complete?
    if @entry_station.nil? || @exit_station.nil?
      return false
    end

    true
  end

  def end_journey(exit_station)
    # if user did not touch in
    raise "You didnt touch in" if @entry_station.nil?

    # save_journey(@entry_station, exit_station)
    # @entry_station = nil
    @exit_station = exit_station
  end

  # def save_journey(station1, station2)
  #   @list_journeys << {entry: station1, exit: station2}
  # end

  def fare
    # return PENALTY_FARE unless complete?
    # zones = [@entry_station.zone, @exit_station.zone].minmax
    # zones.last - zones.first + MINIMUM_FARE
    MINIMUM_FARE
  end

 # def in_journey?
 #   return true if @current_journey[:entry] != nil && @current_journey[:exit] == nil
 #   false
 # end
end
