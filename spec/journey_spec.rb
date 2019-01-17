require 'journey'
describe Journey do

subject(:journey) { described_class.new("Paddington", "Aldgate") }

it 'knows and can report start station for the executed instance' do
  expect(journey.entry_station).to eq("Paddington")
end

end
