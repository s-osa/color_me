require 'spec_helper'

describe ColorMe::Payments, online: true do
  describe "::get" do
    context "with no arguments" do
      before(:all){ @res = ColorMe::Payments.get }

      it "should be Hash", online: true do
        expect(@res).to be_an_instance_of(Hash)
      end

      it "should have a key ':payments'", online: true do
        expect(@res[:payments]).not_to be_nil
      end
    end
  end
end

