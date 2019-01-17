class Journey
  attr_reader :entry_station, :exit_station

def initialize(args)
  empty_station = ""
  @entry_station = args[:in] || empty_station
  @exit_station = args[:out] || empty_station
end

end
