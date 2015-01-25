class Customer
  attr_accessor :type, :best_choose, :week_days
  attr_reader :dates

  def initialize(type = CustomerType::REGULAR, dates = [], best_choose = nil)
    @type = type
    @dates = dates
    @best_choose = best_choose
  end

  def dates=(dates)
    @dates = dates
    @week_days ||= []

    @dates.each do |date|
      @week_days << DateHelper.get_week_day(date)
    end
  end
end

