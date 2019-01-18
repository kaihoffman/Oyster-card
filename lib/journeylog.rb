require 'journey'

class JourneyLog

  def initialize(journey_class = Journey)
    @journeylog = []
    @journey_class = Journey
  end

  def list
    @journeylog
  end

  def start(station)
    @journeylog.push(journey = Journey.new(in: station))
  end

  private

  def get_latest_station
    @journeylog.last
  end



end