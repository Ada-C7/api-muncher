describe Wrapper do

     it 'initializes' do
          wrapper = Wrapper.new
          wrapper.must_be_kind_of Wrapper
     end

     describe 'self.listRecipes(filter)', :vcr do

          let(:recipes) { Wrapper.listRecipes('strawberry')}


          it 'gets a list of recipes with filter' do
               recipes.must_be_instance_of Array
               recipes.each do |recipe |
                    recipe.must_be_instance_of Recipe
               end
          end

          it 'gets a list of recipes without a filter' do
               recipes = Wrapper.listRecipes(nil)

               recipes.must_be_instance_of Array
               recipes.each do |recipe |
                    recipe.must_be_instance_of Recipe
               end
          end

          it 'gets 100 recipes' do
                    recipes.count.must_equal 100
          end
     end

     describe 'get.Recipe(filter)', :vcr do

          it 'can get a recipe with valid id' do
                    recipe = Wrapper.getRecipe('_996fa32937d4f038df2d87a4abda1570')

                    recipe.must_be_instance_of Recipe
          end

          it 'cannot get a recipe without a valid id' do
                    recipe = Wrapper.getRecipe('not valid id')

                    recipe.must_be_nil
          end
     end
end
