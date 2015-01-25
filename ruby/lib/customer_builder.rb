class CustomerBuilder
  LINE_FORMAT = /[^\w\(.\)]/

  def self.create(line)
    # BANG removed all of spaces
    line.delete!(' ')

    # Split by special characteres minus a parenthesis
    # [0] is the type of customer
    # [1..] are the dates
    customer_parts = line.split(LINE_FORMAT)

    if valid_line?(customer_parts)
       customer = Customer.new do |c|
         c.type = customer_parts.first
         # removing customer from array
         customer_parts.shift

         c.dates = DateHelper.get_valid_dates(customer_parts)
       end
    end
  end

  def self.valid_line?(line)
    if has_a_correct_type?(line.first)
       line.shift
       DateHelper.has_valid_dates?(line)
    end
  end

  private

  def self.has_a_correct_type?(type)
    type.eql?(CustomerType::REGULAR) or type.eql?(CustomerType::REWARDS)
  end
end

