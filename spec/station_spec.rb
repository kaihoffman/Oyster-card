require 'station'

describe Station do

  subject(:station) { described_class.new('Paddington', 1) }

  it 'can see station_name' do
    expect(station.name).to eq('Paddington')
  end

  it 'can see station_zone' do
    expect(station.zone).to eq(1)
  end

end