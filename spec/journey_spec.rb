require 'journey'

describe Journey do

  subject(:journey) { described_class.new({ in: 'Paddington', out: 'Aldgate' }) }

  it 'knows and can report start station for the executed instance' do
    expect(journey.entry_station).to eq('Paddington')
  end

  it 'knows and can report end station for the executed instance' do
    expect(journey.exit_station).to eq('Aldgate')
  end

end
