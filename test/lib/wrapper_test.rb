describe Wrapper do

     it 'initializes' do
          wrapper = Wrapper.new
          wrapper.must_be_kind_of Wrapper
     end

     describe 'self.Recipes(filter)' do

          it 'gets a list of recipes with filter' do
               VCR.use_cassette('edamam') do

                    recipes = Wrapper.listRecipes('strawberry')

                    recipes.must_be_instance_of Array
                    recipes.each do |recipe |
                         recipe.must_be_instance_of Recipe
                    end
               end
          end

          it 'gets a list of recipes without a filter' do
               VCR.use_cassette('edamam') do

                    recipes = Wrapper.listRecipes(nil)

                    recipes.must_be_instance_of Array
                    recipes.each do |recipe |
                         recipe.must_be_instance_of Recipe
                    end
               end
          end

          it 'gets 100 recipes' do
               VCR.use_cassette('edamam') do

                    recipes = Wrapper.listRecipes('blueberry')

                    recipes.count.must_equal 100
               end
          end
     end

     describe 'get.Recipe(filter)' do

          it 'can get a recipe with valid id' do
               VCR.use_cassette('edamam') do

                    recipe = Wrapper.getRecipe('_996fa32937d4f038df2d87a4abda1570')

                    recipe.must_be_instance_of Recipe
               end
          end

          it 'cannot get a recipe without a valid id' do
               VCR.use_cassette('edamam') do

                    recipe = Wrapper.getRecipe('not valid id')
                    recipe.must_equal nil
                end
          end
     end
end
