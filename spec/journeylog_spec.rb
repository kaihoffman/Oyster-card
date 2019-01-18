require 'journeylog'

describe JourneyLog do

  subject(:journeylog) { described_class.new(:journey)}
  let(:journey) { double('journey') }
  let(:oystercard) { double(:oystercard) }

  context 'it should start a journey' do

    it 'should handle a touch out' do

    end

  end

  context 'it should end a journey' do

  end

  context 'it should return a list of journeys' do
    it 'should return a list of journeys' do

    end
  end



end