require "test_helper"

describe RecipesController do

  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  it "should get index" do
    get root_path
    must_respond_with :success
  end

  it "should get the results page" do
    get recipes_results_path(query: "chicken")
    must_respond_with :success

  end

  it "should flash an error if there are no results" do
    get recipes_results_path(query: "")
    flash[:error].must_include "Your search had no results. Try again!"
  end

  it "should get a show page for an individual recipe" do
    get show_recipe_path(recipe_id: "86d1850abc8e15b20f0bdec30647839a")
    must_respond_with :success
  end

  it "should render 404 if it can't find a recipe" do
    get show_recipe_path(recipe_id: "850abc")
    must_respond_with :missing

  end

  it "should get a page of recent searches" do
    get searches_path
    must_respond_with :success
  end

  it "should create session[:searches] after first query" do
    get recipes_results_path(query: "chicken")
    session[:searches].must_equal ["chicken"]
  end

  it "should add to session [:searches] after first query" do
    get recipes_results_path(query: "kale")
    session[:searches].must_equal ["kale"]
    get recipes_results_path(query: "chocolate")
    session[:searches].must_equal ["kale", "chocolate"]
  end

end
