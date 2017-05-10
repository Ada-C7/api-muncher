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
end
