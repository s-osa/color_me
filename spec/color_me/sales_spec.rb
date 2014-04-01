require 'spec_helper'

describe ColorMe::Sales, online: true do
  describe "::get" do
    context "with no arguments" do
      before(:all){ @res = ColorMe::Sales.get }

      it "should be Hash" do
        expect(@res).to be_an_instance_of(Hash)
      end

      it "should have a key ':sales'" do
        expect(@res[:sales]).not_to be_nil
      end

      it "should have all sales" do
        expect(@res[:sales].size).to eq(@res[:meta][:total])
      end

      it "should have unique sales" do
        sale_ids = @res[:sales].map{|p| p[:id] }
        expect(sale_ids.uniq.size).to eq(@res[:meta][:total])
      end
    end

    context "with arguments" do
      describe "id" do
        before(:all) do
          res = ColorMe::Sales.get(limit: 1)
          @id = res[:sales].first[:id]
          @res = ColorMe::Sales.get(@id)
        end

        it "should be able to get a sale" do
          expect(@res[:sale][:id]).to eq(@id)
        end
      end

      describe ":limit" do
        before(:all){ @res = ColorMe::Sales.get(limit: 1) }

        it "should be able to limit sales" do
          expect(@res[:sales].size).to eq(1)
        end
      end

      describe ":after" do
        before :all do
          @time = Time.now - 3600 * 48
          @res = ColorMe::Sales.get(after: @time.strftime("%Y-%m-%d"))
        end

        it "should be able to get recent sales" do
          expect(@res[:sales].all?{|s| s[:make_date] >= @time.to_i}).to be_true
        end
      end
    end
  end
end

