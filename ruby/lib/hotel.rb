class Hotel
  attr_accessor :name, :rating, :rates

  def initialize(name, rating, rates)
    @name = name
    @rating = rating
    @rates = rates
  end

  def week_for(customer_type, day_types)
    rates.select {
      |rate| rate.customer_type == customer_type && rate.day_types == day_types
    }.first
  end
end

