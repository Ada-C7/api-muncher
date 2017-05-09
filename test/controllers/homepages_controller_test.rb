require "test_helper"

describe HomepagesController do
  describe "index" do
    it "should get index based on search" do
      VCR.use_cassette("edamam") do
        get search_recipes_path params: {
          search_terms: "chicken"
        }
        must_respond_with :success
      end
    end

    it "should redirect to root_page if no search terms entered" do
      VCR.use_cassette("edamam") do
        get search_recipes_path params: {
          search_terms: nil
        }
        must_respond_with :redirect
        must_redirect_to :root
      end
    end
  end

  describe "show" do
    it "should get show recipe page" do
      VCR.use_cassette("edamam") do
        get recipe_path params: {
          uri: "http://www.edamam.com/ontologies/edamam.owl%recipe_52dcbef56fc205d8f3fa8391c03f6ec8"
        }
        must_respond_with :success
      end
    end

    it "should redirect to index if recipe not found" do
      VCR.use_cassette("edamam") do
        get recipe_path params: {
          uri: "http://bad"
        }
        must_respond_with :redirect
        must_redirect_to search_recipes_path
      end
    end
  end
end
