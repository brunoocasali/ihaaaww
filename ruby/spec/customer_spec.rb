require 'customer'

describe Customer do
  let(:customer) { Customer.new }

  context 'when talked about attributes' do
    it 'needs to receive a correct CustomerType' do
      customer.type = 'Rewards'

      expect(customer.type).to eq(CustomerType::REWARDS)
    end

    it 'best_choose start initialize with a nil value' do
      expect(customer.best_choose).to be_nil
    end

    context 'about dates more specifically' do
      before do
        customer.dates = %w(16Mar2009(mon) 17Mar2009(tues) 18Mar2009(wed))
      end

      it 'needs to have few strings inside them' do
        expect(customer.dates.size).to eq(3)
      end

      it 'based on dates, week_days are filled out' do
        expect(customer.week_days).to eq(%w(mon tues wed))
      end
    end
  end
end

