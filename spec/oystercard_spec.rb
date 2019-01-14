require 'oystercard'

describe Oystercard do

  it 'returns the current balance' do
    expect(subject.balance).to eq (0)
  end

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
    subject.top_up(90)
    expect {subject.top_up(1)}.to raise_error 'Unable to top-up, balance can not exceed £90'
  end

end
