require 'journey'

class JourneyLog
  def initialize(journey_class = Journey)
    @journey = journey_class
  end
end
