require 'oystercard'

describe Oystercard do

  it 'returns the current balance' do
    expect(subject.balance).to eq (0)
  end

end
