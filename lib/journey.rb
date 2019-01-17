class Journey

  attr_reader :entry_station
  attr_accessor :exit_station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize(args)
    empty_station = ''
    @entry_station = args[:in] || empty_station
    @exit_station = args[:out] || empty_station
  end

  def calculate_fare
    penalty = missed_entry_station? || missed_exit_station?

    penalty ? PENALTY_FARE : MINIMUM_FARE

  end

  private

  def missed_entry_station?
    entry_station == '' && exit_station != ''
  end

  def missed_exit_station?
    exit_station == '' && entry_station != ''
  end

end
