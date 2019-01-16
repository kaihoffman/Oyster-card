class Oystercard
  MAX_VALUE = 90
  MIN_JOURNEY_VALUE = 1
  attr_reader :balance, :entry_station, :exit_station
  attr_accessor :journeys

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Unable to top-up, balance can not exceed £#{MAX_VALUE}" if oystercard_full?(amount)

    @balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if insufficient_funds?
    @entry_station = entry_station
    end

  def touch_out(exit_station)
    deduct(MIN_JOURNEY_VALUE)
    @exit_station = exit_station
    @journeys << { @entry_station => @exit_station }
    @entry_station = nil

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
end
