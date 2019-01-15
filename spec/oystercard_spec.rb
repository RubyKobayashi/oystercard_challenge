require 'oystercard'

RSpec.describe Oystercard do


  describe '#top-up' do
    it 'tops up the balance' do
      expect {subject.top_up(1)}.to change {subject.balance}.by(1)
    end

    it 'raises an error when maximum balance is reached' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect {subject.top_up(1)}.to raise_error "Maximum balance of #{maximum_balance} reached"
    end
 end

    describe '#deduct' do
      it 'deducts from the balance' do
          expect {subject.deduct(1)}.to change {subject.balance}.by(-1)
      end
    end

    describe '#in_journey?' do
      it 'is not initially in journey' do
        expect(subject).not_to be_in_journey
      end
    end


      it 'touches in' do
        subject.top_up(5)
        subject.touch_in
        expect(subject).to be_in_journey
      end

    it "raises an error when there are insufficient funds" do
    expect{subject.touch_in}.to raise_error "insufficient funds"
    end

      it 'touches out' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end


end
