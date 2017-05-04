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

end
