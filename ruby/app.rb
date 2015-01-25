# Load all required files to run the app.

Dir["lib/*.rb"].each { |file| require File.expand_path(file) }


lakewood_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 80)
lakewood_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 110)

lakewood_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 90)
lakewood_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 80)

lakewood_rates = []

4.times { |n| lakewood_rates << eval("lakewood_rate_#{n}") }

lakewood_hotel = Hotel.new('Lakewood', 3, lakewood_rates)

data_repository = DataRepository.new
data_repository.read

data_repository.text_data.each do |line|
  customer = CustomerBuilder.create(line)
  HotelFinder.hotel_find_for(customer)

  customer.best_choose.name
end

