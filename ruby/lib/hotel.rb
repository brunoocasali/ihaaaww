class Hotel
  attr_accessor :name, :rate

  def initialize(name = 'a hotel', rate = 3)
    @name = name
    @rate = rate
  end
end

