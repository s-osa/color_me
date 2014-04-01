require 'spec_helper'

describe ColorMe::Products, online: true do
  describe "::get" do
    context "with no arguments" do
      before(:all){ @res = ColorMe::Products.get }

      it "should be Hash", online: true do
        expect(@res).to be_an_instance_of(Hash)
      end

      it "should have a key ':product'", online: true do
        expect(@res[:products]).not_to be_nil
      end

      it "should have all products", online: true do
        expect(@res[:products].size).to eq(@res[:meta][:total])
      end

      it "should have unique products", online: true do
        product_ids = @res[:products].map{|p| p[:id] }
        expect(product_ids.uniq.size).to eq(@res[:meta][:total])
      end
    end

    context "with arguments" do
      describe ":limit" do
        before(:all){ @res = ColorMe::Products.get(limit: 1) }

        it "should be able to limit products" do
          expect(@res[:products].size).to eq(1)
        end
      end
    end
  end
end

