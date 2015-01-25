require 'hotel_rate'

describe HotelRate do
  let(:rate) { HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 63) }

  context 'when talked about attributes' do
    it 'needs to be assign to correct values' do
      expect(rate.price).to eq(63)
      expect(rate.customer_type).to eq(CustomerType::REWARDS)
      expect(rate.day_types).to eq(DayType::WEEKEND)
    end
  end

  context 'when talked about day types' do
    it 'needs to be a weekend' do
      expect(rate).to be_weekend
      expect(rate).to_not be_weekday
    end

    it 'needs to be a weekday' do
      rate.day_types = DayType::WEEKDAYS

      expect(rate).to be_weekday
      expect(rate).to_not be_weekend
    end
  end
end

