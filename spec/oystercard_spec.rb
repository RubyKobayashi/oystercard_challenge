require 'oystercard'

RSpec.describe Oystercard do
let(:station) { double :station }

  describe '#top-up' do
    it 'tops up the balance' do
      expect {subject.top_up(1)}.to change {subject.balance}.by(1)
    end

    context 'when maximum balance is reached' do
    it 'raises an error' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect {subject.top_up(1)}.to raise_error "Maximum balance of #{maximum_balance} reached"
    end
 end
end

    describe '#in_journey?' do
      it 'is not initially in journey' do
        expect(subject).not_to be_in_journey
      end
    end

    describe '#touch_in' do
      it 'starts a journey' do
        subject.top_up(5)
        subject.touch_in(station)
        expect(subject).to be_in_journey
      end

      it 'remembers the entry station' do
        subject.top_up(5)
        subject.touch_in(station)
        expect(subject.entry_station).to eq(station)
      end

      context 'when there are insufficient funds' do
      it "raise an error" do
      expect{subject.touch_in(station)}.to raise_error "insufficient funds"
    end
    end
    end

    describe '#touch_out' do
      it 'ends a journey' do
        subject.top_up(5)
        subject.touch_in(station)
        subject.touch_out
      expect(subject).not_to be_in_journey
      end

      it 'forgets the entry station' do
        subject.top_up(5)
        subject.touch_in(station)
        subject.touch_out
        expect(subject.entry_station).to eq nil
      end


   it "charges minimum fare on touching out" do
   subject.top_up(5)
   subject.touch_in(station)
   expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
   end
   end
end
