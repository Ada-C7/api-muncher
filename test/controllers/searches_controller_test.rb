require "test_helper"

describe SearchesController do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "#index" do

    it "index route works" do
      get root_path
      must_respond_with :success
    end

  end

  describe "#recipes" do

    it "must get recipes page" do
      get root_path
      get recipes_path(search_terms: "chicken", from: 0, to: 12, health: "vegetarian")
      must_respond_with :success
    end

    it "if health param is none it should not pass a health param" do
      get root_path
      get recipes_path(search_terms: "chicken", from: 0, to: 12, health: "none")
      must_respond_with :success
    end

    it "if no health param must succeed" do
      get root_path
      get recipes_path(search_terms: "chicken", from: 0, to: 12)
      must_respond_with :success
    end

    it "if no results should succeed" do
      get root_path
      get recipes_path(search_terms: "sdlkfjsdlkfj", from: 0, to: 12, health: "high-protein")
      must_respond_with :success
    end

  end

  describe "#recipe" do

    it "should get the recipe page" do
      get root_path
      get recipe_path(uri: "http://www.edamam.com/ontologies/edamam.owl%23recipe_71a58ed2f6f75de2a226c53ef77fd5c3")
      must_respond_with :success
    end

    it "should show a nice error message if it can't get it" do
      get root_path
      fake_uri = "http://www.edamam.com/ontologies/edamam.owl%23recipe_fake-uri"
      get recipe_path(uri: fake_uri)
      must_respond_with :missing
    end
  end


  describe "#create" do

    it "can create a search" do
      post login_path, params: { user: users(:aurora)}
      must_respond_with :success

      post save_search_path, params: {
        search: {
          search_terms: "pink lady",
          health: "vegetarian",
          user: users(:aurora)
        }
      }
      must_redirect_to account_path
    end

  end

  describe "#destroy" do
    it "successfully destroys a saved search" do
      proc {post login_path, params: { user: users(:aurora)}
      must_respond_with :success
      delete delete_search_path, params: {search: searches(:search1).id}
      must_respond_with :success}
    end
  end

  describe "check next and prev" do
    it "next will get 12 different recipes" do
      get root_path
      get recipes_path(search_terms: "chicken", from: 0, to: 12, health: "none")
      must_respond_with :success
      get recipes_path(search_terms: "chicken", from: 13, to: 25, health: "none", next: "true")
      must_redirect_to recipes_path
    end

    it "prev will get 10 different recipes" do
      get root_path
      get recipes_path(search_terms: "chicken", from: 0, to: 12, health: "none")
      must_respond_with :success
      get recipes_path(search_terms: "chicken", from: 13, to: 25, health: "none", next: "true")
      must_redirect_to recipes_path
      get recipes_path(search_terms: "chicken", from: 0, to: 12, health: "none", prev: "true")
      must_redirect_to recipes_path
    end

  end

end
