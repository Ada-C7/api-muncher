require "test_helper"

describe Recipe do

 it "requires both recipe label and uri to initialize" do
   proc {
     Recipe.new()
   }.must_raise ArgumentError

   proc {
       Recipe.new( "label" => "monster bread" )
     }.must_raise ArgumentError
   end

end
