require "test_helper"

describe RecipesController do

  describe "root" do
    it "Responds successfully" do
      get root_path
      must_respond_with :success
    end

  end # END of describe "root"


  describe "index" do
    it "Responds with success for a normal search" do
      VCR.use_cassette("recipes1") do
        @recipes = EdamamRecipe.search("chicken")
        get recipes_path, params: {search_text: "chicken", from: "0", to: "10"}
        must_respond_with :success
      end
    end

    it "Responds with success for a search with no hits" do
      VCR.use_cassette("nohits") do
        @recipes = EdamamRecipe.search("kajndao")
        get recipes_path, params: {search_text: "kajndao", from: "0", to: "10"}
        flash[:text_message].must_equal "There were no hits for this search. Try something else :)"
        must_respond_with :success
      end
    end

    it "Responds with success for a search that results in nil" do
      VCR.use_cassette("all_nil") do
        @recipes = EdamamRecipe.search(nil, nil, nil)
        get recipes_path, params: {search_text: nil, from: nil, to: nil}
        flash[:text_message].must_equal  "There were no hits for this search. Try something else :)"
        must_respond_with :success
      end
    end

  end #END of describe "index"


  describe "show" do
    it "Responds with success for a request of recipe that exist" do
      VCR.use_cassette("recipe_1") do
        id = "recipe_74c93392d94076bbb845596ee887a130"
        recipe = EdamamRecipe.show(id)
        get recipe_path(id), params: {uri: id}
        must_respond_with :success
      end
    end

    it "Flashes a message for a bogus id input" do
      VCR.use_cassette("false_id") do
        id = "recipebbb845596ee887a130"
        recipe = EdamamRecipe.show(id)
        get recipe_path(:uri), params: {uri: id}
        flash[:text_message].must_equal  "No such recipe could be found"
        must_respond_with :success
      end
    end

    it "Flashes a message for a nil id input" do
      VCR.use_cassette("nil_id") do
        id = nil
        recipe = EdamamRecipe.show(id) #will return []
        get recipe_path(:uri), params: {uri: id}
        flash[:text_message].must_equal  "No such recipe could be found"
        must_respond_with :success
      end
    end

  end #END of describe "show"


end # END of describe RecipesController
