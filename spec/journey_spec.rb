require 'journey'

describe Journey do

  subject(:journey) { described_class.new({ in: 'Paddington', out: 'Aldgate' }) }

  it 'knows and can report start station for the executed instance' do
    expect(journey.entry_station).to eq('Paddington')
  end

  it 'knows and can report end station for the executed instance' do
    expect(journey.exit_station).to eq('Aldgate')
  end

  context 'it should charge penalties when missing taps' do

    it 'levies a penalty fare when user forgets to touch out' do
      no_entry_journey = Journey.new(out: 'Aldgate')
      expect(no_entry_journey.calculate_fare).to eq(Journey::PENALTY_FARE)
    end

    it 'levies a penalty fare when user forgets to touch in' do
      no_exit_journey = Journey.new(in: 'Paddington')
      expect(no_exit_journey.calculate_fare).to eq(Journey::PENALTY_FARE)
    end

  end

  it 'should charge the minimum fare if no penalty' do
    expect(journey.calculate_fare).to eq(Journey::MINIMUM_FARE)
  end


end
