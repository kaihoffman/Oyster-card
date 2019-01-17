require 'oystercard'

describe Oystercard do
  describe '#balance' do
    before(:each) do
      basicoyster = subject.new
      fulloyster = subject.new.top_up(90)
    end
  end
  it 'returns the current balance' do
    expect(subject.balance).to eq (0)
  end
  describe 'Journeys' do
    it 'has an empty list of journeys by default' do
      expect(subject.journeys).to be_empty
    end
  end
  describe '#top_up' do
    it 'can be topped up' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'returns the updated balance after top up' do
      card = Oystercard.new
      card.top_up(5)
      expect(card.balance).to eq (5)
      # mocked_balance = double(subject.balance)
      # allow(mocked_balance).to receive(subject.top_up(5)).and_return(5)
    end

    it 'returns an error when topping up if balance will exceed £90' do
      expect {subject.top_up(described_class::MAX_VALUE + 1)}.to raise_error "Unable to top-up, balance can not exceed £#{described_class::MAX_VALUE}"
    end
  end

  describe '#in_journey?' do
    it 'can respond to query about journey status' do
      expect(subject).to respond_to(:in_journey?)
    end
  end

  describe '#touch_in' do
    let (:station) {double teststation}
    it 'changes in_journey status to true when called' do
      subject.top_up(10)
      subject.touch_in(:station)
      expect(subject.in_journey?).to eq(true)
    end
    it 'checks use has minimum balance for a single journey' do
      emptyoyster = described_class.new
      expect { emptyoyster.touch_in(:station) }.to raise_error 'Insufficient funds'
    end
    it 'should store station of entry in an entry_station hash' do
      subject.top_up(10)
      subject.touch_in(:station)
      expect(subject.journeys.last.entry_station).to eq(:station)
    end
  end

  describe '#touch_out' do
    let (:exitstation) {double exitstation}
    let (:journey) { double journey }
    it 'changes in_journey status to false when called' do
      subject.top_up(10)
      subject.touch_in(:station)
      subject.touch_out(:exitstation)
      expect(subject.in_journey?).to eq(false)
    end
    it 'deducts minimum charge on touch_out' do
      subject.top_up(10)
      subject.touch_in(:station)
      subject.touch_out(:exitstation)
      expect {subject.touch_out(:exitstation)}.to change{subject.balance}.by (Oystercard::MIN_JOURNEY_VALUE * -1)
    end
    it 'should accept an exit station on touch_out' do
      subject.top_up(10)
      subject.touch_in(:station)
      subject.touch_out(:exitstation)
      expect(subject.journeys.last.exit_station).to eq(:exitstation)
    end
    end
  end
