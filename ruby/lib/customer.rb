class Customer
  attr_accessor :type, :dates, :best_choose

  def initialize(type = CustomerType::REGULAR, dates = [], best_choose = nil)
    @type = type
    @dates = date
    @best_choose = best_choose
  end

end

