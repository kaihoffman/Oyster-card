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
    @journeys.last[:out] == nil
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if insufficient_funds?
    current_journey = {:in => entry_station }
    @journeys << current_journey
    end

  def touch_out(exit_station)
    deduct(MIN_JOURNEY_VALUE)
    @journeys.last[:out] = exit_station
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



# card.journeys[0][card.journeys[0].keys] = "firstexitstation"
