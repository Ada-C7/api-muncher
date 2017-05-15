describe Recipe do

     describe 'Initialize' do

          it 'does not initialize without uri attribute' do
               proc {
                    Recipe.new
               }.must_raise ArgumentError
          end

          it 'does initialize with uri attribute' do
               recipe = Recipe.new('uri')
               recipe.must_be_kind_of Recipe
          end

          it 'initalizes via Wrapper method self.listRecipes', :vcr do
               recipes = Wrapper.listRecipes('strawberry')

               recipes.must_be_instance_of Array
               recipes.each do |recipe |
                    recipe.must_be_instance_of Recipe
               end
          end

          it 'initalizes via Wrapper method self.getRecipe', :vcr do
               recipe = Wrapper.getRecipe('_996fa32937d4f038df2d87a4abda1570')

               recipe.must_be_instance_of Recipe
          end

     end

     describe 'Attributes' do

          let(:recipe) { Recipe.new('uri', id: 'id', name: 'name', photo: 'photo', ingredients: %w(i n g r e d i e n t s), dietary_intel: 'dietary_intel', directions: 'directions', site: 'site') }

          it 'must respond to uri' do
               recipe.must_respond_to :uri
               recipe.must_respond_to :id
               recipe.must_respond_to :name
               recipe.must_respond_to :photo
               recipe.must_respond_to :ingredients
               recipe.must_respond_to :dietary_intel
               recipe.must_respond_to :directions
               recipe.must_respond_to :site
          end

          it "must have the correct uri" do
               recipe.uri.must_equal 'uri'
               recipe.id.must_equal 'id'
               recipe.name.must_equal 'name'
               recipe.ingredients.must_equal %w(i n g r e d i e n t s)
               recipe.ingredients.must_be_kind_of Array
               recipe.dietary_intel.must_equal 'dietary_intel'
               recipe.directions.must_equal 'directions'
               recipe.site.must_equal 'site'
          end

          it 'must not respond to flavors' do
               recipe.wont_respond_to :flavors
          end

          it 'cannot write attributes' do
               proc {
                    recipe.name = 'no_name'
               }.must_raise NoMethodError
          end
     end
end
