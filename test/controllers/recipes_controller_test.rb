require "test_helper"

describe RecipesController do
  it "should get index" do
    get root_path
    must_respond_with :success
  end

    VCR.use_cassette("get_recipes") do
      it "should get a list of recipes" do
        get get_recipes_path, params: {"search" => "chicken", page: "1"}
        must_respond_with :success
      end
    end
end
