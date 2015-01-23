class HotelRate
  attr_accessor :customer_type, :day_types, :price

  def initialize(customer_type, day_types, price)
    @customer_type = customer_type
    @day_types = day_types
    @price = price
  end

  def weekend?
    @day_types.eql? DayType::WEEKEND
  end

  def weekday?
    @day_types.eql? DayType::WEEKDAYS
  end
end

