class CustomerBuilder
  LINE_FORMAT = /[^\w\(.\)]/

  def self.create(line)
    line.delete!(' ')

    customer_parts = line.split(LINE_FORMAT)

    if valid_line?(customer_parts)
      customer = Customer.new
      customer.type = customer_parts.first
      customer.dates = DateHelper.get_valid_dates(customer_parts)

      customer
    end
  end

  def self.valid_line?(line)
    if has_a_correct_type?(line.first)
       DateHelper.has_valid_dates?(line)
    end
  end

  private

  def self.has_a_correct_type?(type)
    type.eql?(CustomerType::REGULAR) or type.eql?(CustomerType::REWARDS)
  end
end

