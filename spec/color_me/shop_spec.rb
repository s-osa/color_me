require 'spec_helper'

describe ColorMe::Shop do
  before do
    ColorMe.token = token || "TOKEN"
  end

  describe ".get" do
    before do
      @res = ColorMe::Shop.get
    end

    it "should be Hash", online: true do
      expect(@res).to be_an_instance_of(Hash)
    end

    it "should have a key ':shop'", online: true do
      expect(@res[:shop]).not_to be_nil
    end
  end
end
