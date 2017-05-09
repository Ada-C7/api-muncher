require "test_helper"

describe Edamam do

  describe "all_search" do
    it "returns an array of recipes" do
      VCR.use_cassette("results") do
        search_item = "chicken"
        response = Edamam.all_search(search_item)
        response.must_be_instance_of Array

        response.each do |item|
          item.must_be_instance_of Result
        end
      end
    end

    it "returns an empty array if nothing's searched" do
      VCR.use_cassette("results") do
        search_item = ""
        response = Edamam.all_search(search_item)
        response.must_equal []
      end
    end

    it "returns an empty array if no search results" do
      VCR.use_cassette("results") do
        search_item = "potato toes"
        response = Edamam.all_search(search_item)
        response.must_equal []
      end
    end

  end

  describe "show_one_result" do
    it "gives the show page from a URI" do
      VCR.use_cassette("results") do
        uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_f1c853a77986214680bbdd424883499a"
        response = Edamam.show_one_result(uri)
        response.must_be_instance_of Array
      end
    end
  end

end
