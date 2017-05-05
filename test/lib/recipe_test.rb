require 'test_helper'

describe Recipe do
  it "Cannot be initialized without parameters" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "Name"
    }.must_raise ArgumentError
  end

  it "Must initialize name and id properly" do

  end

  it "Can create a recipe instance" do

  end


end
