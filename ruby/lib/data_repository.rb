class DataRepository
  ROOT_PATH = 'data/data.txt'

  attr_accessor :path, :text_data

  def initialize(path = ROOT_PATH)
    @path = path
    @text_data = ''
    # ver se existe o diretório
    # ver se existe o arquivo dentro.
  end

  def read
    if has_file?
      file = File.new(@path, 'r')

      while (line = file.gets)
        @text_data << line
      end

      file.close
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

