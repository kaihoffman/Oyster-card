require 'oystercard'

describe Oystercard do

  it 'returns the current balance' do
    expect(subject.balance).to eq (0)
  end

  it 'can be topped up' do
    expect(subject).to respond_to(:top_up).with(1).argument

  end

end
