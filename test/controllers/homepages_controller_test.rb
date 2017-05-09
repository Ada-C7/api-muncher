require 'test_helper'

describe HomepagesController do
  before do
    VCR.insert_cassette("edamam")
  end

  after do
    VCR.eject_cassette("edamam")
  end

  describe '#index' do
    it "should get index" do
      get root_path
      must_respond_with :success
    end
  end
end
