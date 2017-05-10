require "test_helper"

describe RecipesController do

    it "should get Homepage" do
        get root_path
        must_respond_with :success
    end

    it "should get results page " do
      # TODO PASS
      VCR.use_cassette("controller") do
        params = { search: "chicken" }
        get results_path(params)
        must_respond_with :success
      end
    end

    it "should get recipe show page " do
      # TODO PASS

      VCR.use_cassette("controller") do
      params = {name: "Herbes de Provence Rotisserie Chickens",
      uri: "http://www.edamam.com/ontologies/edamam.owl%23recipe_f1c853a77986214680bbdd424883499a"}
      get recipe_path(params)
      must_respond_with :success
    end
  end
end
