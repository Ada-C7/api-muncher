require 'test_helper'

describe Recipe do
  it "Requires 8 arguments to initialize" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new "name"
    }.must_raise ArgumentError
  end

  it "Can find a Recipe instance" do
  end

  it "has th accessor"
end
