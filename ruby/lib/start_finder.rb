require 'yaml'

Dir["lib/*.rb"].each { |file| require File.expand_path(file) }

class StartFinder

  def self.run(path = DataRepository::ROOT_PATH)
    data_repository = DataRepository.new(path)
    data_repository.read

    # Create your own hotels to use!
    hotels = []
    # This block is optional, is just to load some variables to fast app running
    $/="\n\n"
    File.open('data/objects.yaml', 'r').each do |object|
      hotels << YAML::load(object)
    end

    hotels.flatten!

    finder = HotelFinder.new(hotels)

    data_repository.text_data.each do |line|
      customer = CustomerBuilder.create(line)

      unless customer.nil?
        finder.hotel_find_for(customer)
        puts customer.best_choose.name
      end
    end
  end

end

