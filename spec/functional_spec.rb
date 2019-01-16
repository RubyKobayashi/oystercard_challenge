# require 'oystercard'
#
# RSpec.describe 'functions' do
#   let(:entry_station) { double :station }
#   let(:exit_station) { double :station}
#
#   it "updates the journey when touching in" do
#     oystercard = Oystercard.new
#     oystercard.touch_in(:entry_station)
#     expect(subject.current_journey[:entry]).to eq(entry_station)
#   end
