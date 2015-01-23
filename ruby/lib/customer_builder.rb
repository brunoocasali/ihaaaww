class CustomerBuilder

  # Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)
  # type: Regular
  # dates: ['16Mar2009(mon)', '17Mar2009(tues)', '18Mar2009(wed)']

  def self.create_customer(line)
   # BANG removed all of spaces
   line.delete!(' ')

  end
end

