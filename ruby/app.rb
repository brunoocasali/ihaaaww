# Load all required files to run the app.
require 'yaml'

Dir["lib/*.rb"].each { |file| require File.expand_path(file) }

lake_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 90)
lake_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 80)

lake_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 110)
lake_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 80)

bridge_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 60)
bridge_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 50)

bridge_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 160)
bridge_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 110)

ridge_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 150)
ridge_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 40)

ridge_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 220)
ridge_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 100)

tiger_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 200)
tiger_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 99)

tiger_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 198)
tiger_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 91)

robin_rate_0 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKEND, 160)
robin_rate_2 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKEND, 84)

robin_rate_1 = HotelRate.new(CustomerType::REGULAR, DayType::WEEKDAYS, 99)
robin_rate_3 = HotelRate.new(CustomerType::REWARDS, DayType::WEEKDAYS, 50)



bridge_rates = []; lake_rates = []; ridge_rates = []; tiger_rates = []; robin_rates = []

4.times { |n|
  lake_rates << eval("lake_rate_#{n}")
  bridge_rates << eval("bridge_rate_#{n}")
  ridge_rates << eval("ridge_rate_#{n}")
  tiger_rates << eval("tiger_rate_#{n}")
  robin_rates << eval("robin_rate_#{n}")
}

lake_hotel = Hotel.new('Lakewood', 3, lake_rates)
bridge_hotel = Hotel.new('Bridgewood', 4, bridge_rates)
ridge_hotel = Hotel.new('Ridgewood', 5, ridge_rates)
tiger_hotel = Hotel.new('TigerWood', 6, tiger_rates)
robin_hotel = Hotel.new('RobinWood', 4, robin_rates)

file = File.new('data/pre_objects.yml', 'w')

file.write(lake_hotel.to_yaml)
file.write(bridge_hotel.to_yaml)
file.write(ridge_hotel.to_yaml)
file.write(robin_hotel.to_yaml)
file.write(tiger_hotel.to_yaml)

data_repository = DataRepository.new
data_repository.read

finder = HotelFinder.new([ridge_hotel, lake_hotel, bridge_hotel, tiger_hotel, robin_hotel])

data_repository.text_data.each do |line|
  customer = CustomerBuilder.create(line)

  unless customer.nil?
    finder.hotel_find_for(customer)
    puts customer.best_choose.name
  end
end

