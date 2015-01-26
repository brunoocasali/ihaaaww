class DataRepository
  ROOT_PATH = 'data/data.txt'

  attr_accessor :path, :text_data

  def initialize(path = ROOT_PATH)
    @path = path
    @text_data = []
  end

  def read
    if has_file?
      File.open(@path, 'r').each do |line|
        @text_data << line
      end
    end
  end

  def has_file?
    if File.exists?(@path)
      File.extname(@path) == '.txt'
    end
  end

  def has_data_directory?
    File.dirname(@path) == 'data'
  end
end

