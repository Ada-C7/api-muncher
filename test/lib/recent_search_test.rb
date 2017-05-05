require 'test_helper'

describe "RecentSearch" do

  it "requires 1 argument to initialize" do
    proc {
      RecentSearch.new
    }.must_raise ArgumentError

  end

  it "can create a RecentSearch instance" do
    search = RecentSearch.new("search_terms")

    search.class.must_equal RecentSearch

  end

  it "can create a search with optional params" do

    search = RecentSearch.new("search_terms", "health")

    search.class.must_equal RecentSearch
  end

  it "has the accessor methods" do
    search = RecentSearch.new("search_terms", "health")

    search.search_terms.must_equal "search_terms"
    search.health.must_equal "health"

  end


end
