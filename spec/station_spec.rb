require 'station'

RSpec.describe Station do
  subject { described_class.new("Aldgate East", 2) }

  describe 'name' do
    it "is expected to return the name of the station" do
      expect(subject.name).to eq "Aldgate East"
    end
  end
  describe 'zone' do
    it "is expected to return the zone of the station" do
      expect(subject.zone).to eq 2
    end
  end

end
