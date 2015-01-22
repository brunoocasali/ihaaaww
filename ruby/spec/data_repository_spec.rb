require 'data_repository'

describe DataRepository do
  let(:data_repository) { DataRepository.new }

  context 'when talked about a directories' do
    it "is valid if it 'data' dir exists" do
      expect(data_repository).to have_data_directory
    end

    it "is invalid if 'data' dir ins't exists" do
      data_repository.path = 'any-directory/'

      expect(data_repository).to_not have_data_directory
    end
  end

  context 'when talked about a text data file' do
    it 'is valid only with have a .txt extension' do
      expect(data_repository).to have_file
    end

    it "is invalid if doesn't have a .txt extension" do
      data_repository.path = 'any-directory/any-file.rb'

      expect(data_repository).to_not have_file
    end

    it 'is usable if have any text data' do
      expect(data_repository.has_text_data?).to be > 0
    end
  end

  context 'when talked about a text data inside the file' do
    it 'needs to have a data in a correct form'
  end
end

