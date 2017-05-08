require "test_helper"

describe RecipesController do
  describe "index" do
    it "responds successfully with a page load" do
      get root_path
      must_respond_with :success
    end

    it "sets the variable as empty when first loaded" do
      get root_path
      @recipes.must_be_nil
    end
  end

  describe "search" do
    # it "returns a message if the recipes are nil" do
    #   @recipes = nil
    #   post search_path
    #   must_respond_with :not_found
    # end

    # it "responds successfully with good data" do
    #   params = "watermelon"
    #   post recipes_path(params)
    #   @recipes.wont_be_nil
    #   must_respond_with :success
    # end
  end

  describe "show" do
  end

end
