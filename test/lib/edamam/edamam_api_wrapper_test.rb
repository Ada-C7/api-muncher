require 'test_helper'

describe EdamamApiWrapper do
  describe "Testing Self.search" do
    #Anything inside block will use this casette
    it "can get a list of recipes with search terms" do
      VCR.use_cassette("edamam") do
        results = EdamamApiWrapper.search("chicken pasta")
        results.parsed_response.must_be_instance_of Hash
      end
    end
  end
end
