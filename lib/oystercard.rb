require_relative 'journey'

# responsible for managing journeys and balance
class Oystercard
  MAX_VALUE = 90
  MIN_JOURNEY_VALUE = 1
  attr_reader :balance
  attr_accessor :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Unable to top-up, balance can not exceed £#{MAX_VALUE}" if oystercard_full?(amount)

    @balance += amount
  end

  def in_journey?
    @journeys.last.exit_station == ''
  end

  def touch_in(entry_station)
    raise 'Insufficient funds' if insufficient_funds?

    @journeys.push(make_journey(entry_station))
    end

  def touch_out(exit_station)
    deduct(MIN_JOURNEY_VALUE)
    @journeys.last.exit_station = exit_station
  end

  private

  def oystercard_full?(amount)
    @balance + amount > MAX_VALUE
  end

  def insufficient_funds?
    @balance < MIN_JOURNEY_VALUE
  end

  def deduct(amount)
    @balance -= amount
  end

  def make_journey(entry_station)
    Journey.new(in: entry_station)
  end

end
