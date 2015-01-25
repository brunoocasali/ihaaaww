class DateHelper
  DATE_FORMAT = /([0-9]+)([a-z]+)(([0-9]{2})|([0-9]{4}))\(([a-z]+)\)/i

  def self.has_correct_form?(date_string)
    DATE_FORMAT.match(date_string).nil? ? false : true
  end

  def self.get_week_day(date_string)
    DATE_FORMAT.match(date_string)[6]
  end

  def self.has_valid_dates?(dates)
    dates.each do |date|
      if DateHelper.has_correct_form?(date)
        return true
      end
    end
    false
  end

  def self.get_valid_dates(dates)
    valid_ones ||= []

    dates.each do |date|
      valid_ones << date if DateHelper.has_correct_form?(date)
    end

    valid_ones
  end

end

