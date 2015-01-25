class HotelFinder
  A_BIG_INT = 2_919_988_999

  attr_accessor :hotels

  def initialize(hotels)
    @hotels = hotels
  end

  def hotel_find_for(customer)
    unless customer.nil?
      weekday_counter = count_days(customer.week_days, DayType::WEEKDAYS)
      weekend_counter = count_days(customer.week_days, DayType::WEEKEND)
      cheapest_price = A_BIG_INT

      @hotels.each do |hotel|
        weekday = hotel.week_for(customer.type, DayType::WEEKDAYS).price
        weekend = hotel.week_for(customer.type, DayType::WEEKEND).price

        sum = (weekend_counter * weekend) + (weekday_counter * weekday)

        if cheapest_price > sum
          cheapest_price = sum
          customer.best_choose = hotel
        elsif cheapest_price == sum
          if hotel.rating > customer.best_choose.rating
            customer.best_choose = hotel
          end
        end
      end
    end
  end

  private

  def count_days(customer_days, type_days)
    (customer_days & type_days).size
  end
end

