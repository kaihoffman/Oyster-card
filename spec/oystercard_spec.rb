require 'oystercard'

describe Oystercard do

  it 'returns the current balance' do
    expect(subject.instance_variable_get(:@balance)).to eq (0)
  end

end
