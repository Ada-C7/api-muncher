require "test_helper"

describe SearchesController do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe "#index" do

    it "must get index" do

    end

    it "must must be okay if search button pressed with no search terms" do

    end

    it "must redirect to recipes page if search button pressed with search terms" do

    end

  end

  describe "#recipes" do

    it "" do

    end

  end

  describe "#recipe" do
    it "should get a single recipe successfully" do

    end

    it "should show a nice error message if it can't get it" do

    end
  end

  describe "#create" do

    it "successfully saves a search" do

    end

  end
  
  # how the heck do I test this??
  describe "next" do
    it "next will get 10 different recipes" do

    end

    it "next will not go further if there aren't more recipes" do

    end


  end

  describe "prev" do
    it "prev will get 10 different recipes" do

    end

    it "prev will not go back if no prev recipes" do

    end
  end
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
end
