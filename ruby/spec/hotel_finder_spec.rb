require 'hotel_finder'

describe HotelFinder do
  let(:hotels) {
    hotels ||= []

    lake_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 90)
    lake_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 80)

    lake_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 110)
    lake_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 80)

    bridge_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 60)
    bridge_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 50)

    bridge_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 160)
    bridge_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 110)

    @hotel_1 = Hotel.new('Lakewood', 3, [lake_rate_0, lake_rate_1, lake_rate_2, lake_rate_3])
    @hotel_2 = Hotel.new('Bridgewood', 4, [bridge_rate_0, bridge_rate_1, bridge_rate_2, bridge_rate_3])

    hotels << @hotel_1
    hotels << @hotel_2
  }

  let(:finder) { HotelFinder.new(hotels) }

  context 'when talked about attributes' do

    it 'hotels needs to receive a correct array of hotels' do
      finder.hotels = hotels

      expect(finder.hotels).to be_a Array
      expect(finder.hotels).to include(@hotel_1)
      expect(finder.hotels.size).to eq(2)
    end
  end

  context 'when I need to find a good hotel' do
    let(:customer) { Customer.new }

    before do
      customer.type = CustomerType::REGULAR
    end

    it 'but first I want to know how many days I stay on there' do
      customer.dates = %w(16Mar2009(mon) 23Jan2015(sat) 18Mar2009(wed))

      weekdays = finder.send(:count_days, customer.week_days, DayType::WEEKDAYS)
      weekend = finder.send(:count_days, customer.week_days, DayType::WEEKEND)

      expect(weekend).to eq(1)
      expect(weekdays).to eq(2)
    end

    it 'expect to return Bridgewood hotel for this case.' do
      customer.dates = %w(20Mar2009(fri) 21Mar2009(sat) 22Mar2009(sun))

      finder.hotel_find_for(customer)

      expect(customer.best_choose).to eq(@hotel_2)
    end

    it 'expect to return Lakewood hotel for this case.' do
      customer.dates = %w(16Mar2009(mon) 17Mar2009(tues) 18Mar2009(wed))

      finder.hotel_find_for(customer)

      expect(customer.best_choose).to eq(@hotel_1)
    end

  end
end

