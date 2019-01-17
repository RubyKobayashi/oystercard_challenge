require 'journey'

RSpec.describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station}

  it 'remembers the entry station' do
    subject.start_journey(entry_station)
    expect(subject.entry_station).to eq(entry_station)
  end

  # describe '#in_journey?' do
  #   it 'is not initially in journey' do
  #     expect(subject).not_to be_in_journey
  #   end
  # end

  it 'remembers the exit station' do
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    expect(subject.list_journeys[0][:exit]).to eq(exit_station)
  end


  it "returns minimum fare" do
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    expect(subject.fare).to eq Oystercard::MINIMUM_FARE
  end

  it "if only touched in" do
    subject.start_journey(entry_station)
    expect{subject.start_journey(entry_station)}.to raise_error "You didnt touch out"
  end

  it "if only touched out" do
    expect{subject.end_journey(exit_station)}.to raise_error "You didnt touch in"
  end

  describe "#list_journeys" do
    it "lists all previous journeys" do
      subject.start_journey(entry_station)
      subject.end_journey(exit_station)
      expect(subject.list_journeys).to eq [entry: entry_station, exit: exit_station]
    end
  end

end
