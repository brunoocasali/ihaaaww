require 'data_repository'

describe DataRepository do
  context 'when talked about a directories' do
    it 'is valid if it exists'
    it "is invalid if isn't exists"
  end

  context 'when talked about a text data file' do
    it 'is valid only with have a .txt extension'
    it "is invalid if doesn't have a .txt extension"
    it 'is usable if have any data text'
    it "needs return nil if doesn't have any text data"
  end

  context 'when talked about a text data inside the file' do
    it 'needs to have a data in a correct form'
  end
end

