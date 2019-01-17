require 'oystercard'

RSpec.describe Oystercard do
let(:entry_station) { double :station }
let(:exit_station) { double :station}

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


    describe '#touch_in' do

      it 'removes minimum fare on valid touch in/touch out do end' do
         subject.top_up(10)
         subject.touch_in(entry_station)
         expect{subject.touch_out(exit_station)}.to change {subject.balance}.by(-Oystercard::MINIMUM_FARE)
      end

      it 'removes penalty fare on touch in/no touch out' do
        subject.top_up(10)
        subject.touch_in(entry_station)
        expect{subject.touch_in(entry_station)}.to change {subject.balance}.by(-Oystercard::PENALTY_FARE)

      end
      it 'removes penalty fare on touch out/no touch in' do
        subject.top_up(10)
        expect{subject.touch_out(exit_station)}.to change {subject.balance}.by(-Oystercard::PENALTY_FARE)

      end

      context 'when there are insufficient funds' do
      it "raise an error" do
      expect{subject.touch_in(entry_station)}.to raise_error "insufficient funds"
    end
    end
    end

    describe '#touch_out' do

   it "charges minimum fare on touching out" do
   subject.top_up(5)
   subject.touch_in(entry_station)
   expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
   end

   it {is_expected.to respond_to(:touch_out).with(1).argument}
   end





end
