require 'oystercard'

RSpec.describe Oystercard do
  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:top_up).with(1).argument }

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
end
