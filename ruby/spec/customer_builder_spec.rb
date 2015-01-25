require 'customer_builder'

describe CustomerBuilder do
  let(:builder) { CustomerBuilder }

  describe :create do
    it 'needs to match and split correct line format' do
      correct = 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)'

      customer = builder.create(correct)

      expect(customer).to be_a Customer
      expect(customer.type).to eq(CustomerType::REGULAR)
      expect(customer.week_days).to eq(['mon', 'tues', 'wed'])
    end

    it 'needs to be false when matching a incorrect line format' do
      incorrect = 'kkkkk, something here, : anything 2015'

      customer = builder.create(incorrect)

      expect(customer).to be_nil
    end
  end
end

