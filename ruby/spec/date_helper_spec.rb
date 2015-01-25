require 'date_helper'

describe DateHelper do
  let(:valid_dates) { ['2Mar2015(mon)', '19Ago2014(tues)', '22Jan2015(sat)'] }
  let(:invalid_dates) { ['asd2Ma5asdmon', '19s1s4ataues', '22Jan2)'] }
  let(:merged_dates) { ['2Mar2015(mon)', '1s9sdgo2014tues', '22Jan2015(sat)'] }

  context 'when date strings has a valid format return true' do
    it 'if DATE_FORMAT matches a date string' do
      matcher = DateHelper::DATE_FORMAT.match(valid_dates.first)

      expect(matcher[0]).to eq('2Mar2015(mon)')
      expect(matcher[3]).to eq('2015')
      expect(matcher[6]).to eq('mon')
    end

    it 'if formatted correctly' do
      expect(DateHelper.has_correct_form?(valid_dates[1])).to eq(true)
    end

    it 'if any valid date' do
      expect(DateHelper.has_valid_dates?(valid_dates)).to eq(true)
      expect(DateHelper.has_valid_dates?(merged_dates)).to eq(true)
    end

    it 'if has any date correct formatted get them' do
      expect(DateHelper.get_valid_dates(merged_dates).size).to eq(2)
    end
  end

  context 'when dates has incorrect formats return false!' do
    it "if does't formatted properly" do
      expect(DateHelper.has_correct_form?(invalid_dates.first)).to eq(false)
    end

    it 'if has all invalid dates' do
      expect(DateHelper.has_valid_dates?(invalid_dates)).to eq(false)
    end

    it 'if has all dates incorrect formatted get nothing' do
      expect(DateHelper.get_valid_dates(invalid_dates).size).to eq(0)
    end
  end
end

