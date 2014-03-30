require 'spec_helper'

describe ColorMe::Sales do
  describe ".get" do
    let(:res){ ColorMe::Sales.get }

    it "should be Hash", online: true do
      expect(res).to be_an_instance_of(Hash)
    end

    it "should have a key ':sales'", online: true do
      expect(res[:sales]).not_to be_nil
    end

    describe "limit" do
      let(:res){ ColorMe::Sales.get(limit: 1) }

      it "should be able to limit sales", online: true do
        expect(res[:sales].size).to eq(1)
      end
    end
  end

  describe ".get_all" do
    let(:res){ ColorMe::Sales.get_all }

    it "should be Hash", online: true do
      p res[:sales].size
      expect(res).to be_an_instance_of(Hash)
    end

    it "should have all sales", online: true do
      expect(res[:sales].size).to eq(res[:meta][:total])
    end

    it "should have unique sales", online: true do
      sale_ids = res[:sales].map{|p| p[:id] }
      expect(sale_ids.uniq.size).to eq(res[:meta][:total])
    end
  end
end

