class Oystercard
  MAX_VALUE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Unable to top-up, balance can not exceed £#{MAX_VALUE}" if oystercard_full?(amount)

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?

  end

  def touch_in

  end

private
  def oystercard_full?(amount)
    @balance + amount > MAX_VALUE
  end

end
