require 'spec_helper'

describe ColorMe::Categories, online: true do
  describe "::get" do
    context "with no arguments" do
      before(:all){ @res = ColorMe::Categories.get }

      it "should be Hash", online: true do
        expect(@res).to be_an_instance_of(Hash)
      end

      it "should have a key ':categories'", online: true do
        expect(@res[:categories]).not_to be_nil
      end
    end
  end
end

