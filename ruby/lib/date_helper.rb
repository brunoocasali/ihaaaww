class DateHelper
 DATE_FORMAT = /([0-9]+)([a-z]+)(([0-9]{2})|([0-9]{4}))\(([a-z]+)\)/i

 def has_correct_form?(date_string)
  true if DATE_FORMAT.match(date_string)
 end
end

