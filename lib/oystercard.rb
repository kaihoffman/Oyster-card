class Oystercard
  MAX_VALUE = 90
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
    @in_use = true
  end

  def touch_out

  end

private
  def oystercard_full?(amount)
    @balance + amount > MAX_VALUE
  end

end
