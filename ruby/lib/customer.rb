class Customer
  attr_accessor :type, :date, :best_choose

  def initialize(type = CustomerType::REGULAR, date = [], best_choose = nil)
    @type = type
    @date = date
    @best_choose = best_choose
  end

end

