require 'hotel'

describe Hotel do
  let(:customer) { Customer.new }
  let(:hotel) {
    Hotel.new('Lakewood', 5,
              [HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 93)])
  }

  context 'has some attributes' do
    it 'that need to receive correct name' do
      expect(hotel.name).to eq('Lakewood')
    end

    it 'that need to receive correct rating' do
      expect(hotel.rating).to eq(5)
    end

    it 'rating needs to be a integer number' do
      expect(hotel.rating).to be_a Integer
    end

    it 'needs to receive a least one rate of type HotelRate' do
      expect(hotel.rates.first).to be_a HotelRate
      expect(hotel.rates.size).to eq(1)
    end
  end

  context 'how much cost some days at the hotel for regular customer' do
    it 'needs to be 93.00 for weekends and regular customer' do
      rate = hotel.week_for(customer.type, DayType::WEEKEND)

      expect(rate.price).to eq(93)
    end
  end
end

