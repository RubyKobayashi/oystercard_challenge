require 'journey'

RSpec.describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station}

  it 'remembers the entry station' do
    subject.start_journey(entry_station)
    expect(subject.current_journey[:entry]).to eq(entry_station)
  end

  # describe '#in_journey?' do
  #   it 'is not initially in journey' do
  #     expect(subject).not_to be_in_journey
  #   end
  # end

  it 'remembers the exit station' do
    subject.end_journey(exit_station)
    expect(subject.current_journey[:exit]).to eq(exit_station)
  end

  it "returns minimum fare" do
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    expect(subject.fare).to eq Oystercard::MINIMUM_FARE
  end

  it "if only touched in" do
    subject.start_journey(entry_station)
    expect(subject.fare).to eq Oystercard::PENALTY_FARE
  end

  it "if only touched out" do
    subject.end_journey(exit_station)
    expect(subject.fare).to eq Oystercard::PENALTY_FARE
  end
end
