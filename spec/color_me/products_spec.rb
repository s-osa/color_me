require 'spec_helper'

describe ColorMe::Products do
  before do
    ColorMe.token = token || "TOKEN"
  end

  describe ".get" do
    before do
      @res = ColorMe::Products.get
    end

    it "should be Hash", online: true do
      expect(@res).to be_an_instance_of(Hash)
    end

    it "should have a key ':product'", online: true do
      expect(@res[:products]).not_to be_nil
    end

    it "should be able to limit products", online: true do
      @res = ColorMe::Products.get(limit: 1)
      expect(@res[:products].size).to eq(1)
    end
  end
end

