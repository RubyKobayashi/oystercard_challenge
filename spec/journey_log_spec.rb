require 'journey_log'
RSpec.describe JourneyLog do
  let(:journey_class) { double :journey }
  it 'has a dependency injection of journey class on initiation' do
    journey_log = described_class.new(journey_class)
    expect(journey_log.instance_variable_get(:@journey)).to eq journey_class
  end
end
