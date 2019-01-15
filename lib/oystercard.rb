class Oystercard
  MAX_VALUE = 90
  MIN_JOURNEY_VALUE = 1
  attr_reader :balance, :in_use, :entry_station

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "Unable to top-up, balance can not exceed £#{MAX_VALUE}" if oystercard_full?(amount)

    @balance += amount
  end

  def in_journey?
    @in_use
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if insufficient_funds?
    @entry_station = entry_station
    @in_use = true
  end

  def touch_out
    deduct(MIN_JOURNEY_VALUE)
    @entry_station = nil
    @in_use = false
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
