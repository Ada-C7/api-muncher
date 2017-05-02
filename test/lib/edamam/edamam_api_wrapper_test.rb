require 'test_helper'

describe EdamamApiWrapper do
  describe "Testing Self.search" do
    #Anything inside block will use this casette
    it "can get a list of recipes" do
      VCR.use_cassette("edamam") do
        results = EdamamApiWrapper.search("chicken pasta")
        results.must_be_instance_of Array
      end
    end
  end
end
