require 'yaml'

# Load all required files to run the app.
Dir["lib/*.rb"].each { |file| require File.expand_path(file) }

data_repository = DataRepository.new
data_repository.read

hotels = []
$/="\n\n"
File.open('data/objects.yaml', 'r').each do |object|
  hotels << YAML::load(object)
end

finder = HotelFinder.new(hotels.flatten!)

data_repository.text_data.each do |line|
  customer = CustomerBuilder.create(line)

  unless customer.nil?
    finder.hotel_find_for(customer)
    puts customer.best_choose.name
  end
end

