class Oystercard
  MAX_VALUE = 90
  MIN_JOURNEY_VALUE = 1
  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
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
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(MIN_JOURNEY_VALUE)
    @entry_station = nil
    @in_journey = false
    @exit_station = exit_station
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
