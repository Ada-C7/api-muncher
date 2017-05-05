require "test_helper"

describe HomepagesController do
  it "should get index" do
    VCR.use_cassette("edamam") do
    get root_path
    must_respond_with :success
    end
  end

  it "should get show" do
    VCR.use_cassette("edamam") do
    get homepages_show_path("29f79e3691f3732cfb97c459fa925f65")
    value(response).must_be :success?
    end
  end

  it "flash error if no recipe found" do
    VCR.use_cassette("edamam") do
    get homepages_index_path("oie03")
    must_respond_with :success
    end
  end

  it "gets index with params" do
    VCR.use_cassette("edamam") do
    get root_path(), params: {search_words: "chicken"}
    must_respond_with :success
    end
  end

  it "flash error with no recipes found" do
    VCR.use_cassette("edamam") do
    get root_path(), params: {search_words: "23948234"}
    must_respond_with :redirect
    end
  end

  it "should get show" do
    VCR.use_cassette("edamam") do
    get homepages_show_path("zzzzzzzzzz")
    must_respond_with :success
    end
  end
end
