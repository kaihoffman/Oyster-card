class Oystercard
  MAX_VALUE = 90
  MIN_JOURNEY_VALUE = 1
  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Unable to top-up, balance can not exceed £#{MAX_VALUE}" if oystercard_full?(amount)

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    fail "Insufficient funds" if @balance < MIN_JOURNEY_VALUE
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

private
  def oystercard_full?(amount)
    @balance + amount > MAX_VALUE
  end

  def insufficient_funds?
    @balance < MIN_JOURNEY_VALUE
  end

end
