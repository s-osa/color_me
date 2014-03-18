require 'spec_helper'

describe ColorMe do
  describe "token" do
    it "should be able to set a token" do
      ColorMe.token = "TokenString"
    end

    it "should NOT be able to get a token" do
      expect{ ColorMe.token }.to raise_error NoMethodError
    end
  end
end
