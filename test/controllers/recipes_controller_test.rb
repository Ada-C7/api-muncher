require "test_helper"

describe RecipesController do
  describe "search" do
    it "responds successfully" do
      get root_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "responds successfully when there are many recipes" do
      VCR.use_cassette("recipes") do
        get recipes_path("recipe" => {"q" => "brownies"})
        must_respond_with :success
      end
    end

    it "redirects to the root path when no recipes are found" do
      VCR.use_cassette("recipes") do
        get recipes_path("recipe" => {"q" => "bronies"})
        must_redirect_to root_path
      end
    end
  end

  describe "show" do
    it "finds a recipe that exists" do
      VCR.use_cassette("recipes") do
        get recipe_path({"q"=>"brownies", id: "111284477abdb16dd2fb106815d4c119"})
        must_respond_with :success
      end
    end

    it "returns a 404 status for a recipe that does not exist" do
      VCR.use_cassette("recipes") do
        get recipe_path({"q"=>"brownies", id: "fake_id"})
        must_respond_with :not_found
      end
    end
  end
end
