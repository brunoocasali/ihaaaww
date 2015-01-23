class Hotel
  attr_accessor :name, :rating, :rates

  def initialize(name, rating, rates = [])
    @name = name
    @rating = rating
    @rates = rates
  end
end

#110, 80, 90, 80
#- Lakewood with a rating of 3 has
#regular customer
#  weekday = 110$
#  weekend = 80$

#rewards customer
#  weekday = 90$
#  weekend = 80$

