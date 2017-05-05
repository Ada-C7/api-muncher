require "test_helper"

describe Recipe do

 it "requires recipe label " do
   options = {
     label: nil,
     image: "www.url.com",
     uri: "www.recipe.com"
   }

   proc {
     Recipe.new(options)
   }.must_raise ArgumentError

   end

   it "raises error"

end
