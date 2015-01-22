class DataRepository
  ROOT_PATH = 'data/data.txt'

  attr_accessor :path

  def initialize(path = ROOT_PATH)
    @path = path
    # ver se existe o diretório
    # ver se existe o arquivo dentro.
  end

  def has_text_data?
    counter = 0

    if has_file?
      file = File.new(@path, 'r')

      while (line = file.gets)
        counter += 1
      end
      file.close
    end

    counter
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

