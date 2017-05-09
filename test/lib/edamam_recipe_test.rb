require 'test_helper'

describe EdamamRecipe do
    describe 'initialize' do
        it 'takes a search term' do
            VCR.use_cassette('recipes') do
                search_term = 'tofu'
                er = EdamamRecipe.new(search_term)
                er.search_term.must_equal search_term
            end
        end

        it 'requires a search term' do
            VCR.use_cassette('recipes') do
                proc do
                    EdamamRecipe.new
                end.must_raise ArgumentError
            end
        end
    end

    describe 'find' do
        it 'finds recipes that correspond to the search term' do
            VCR.use_cassette('recipes') do
                recipes = EdamamRecipe.new('tofu')
                recipes.find(1).must_be_instance_of Array
            end
        end

        it 'finds different results on another page' do
            VCR.use_cassette('recipes') do
                recipes = EdamamRecipe.new('tofu')
                recipes.find(1).wont_equal recipes.find(3)
            end
        end

        it 'fails to find a bogus page' do
            VCR.use_cassette('recipes') do
                recipes = EdamamRecipe.new('tofu')
                # API only allows 1000 results therefore max pages is 100
                bogus_page = recipes.find(340)

                bogus_page.must_be_empty
            end
        end

        it 'finds recipes that correspond to the label filter' do
            VCR.use_cassette('recipes') do
                recipes = EdamamRecipe.new('tofu')
                og_recipes = recipes.find(1)
                proc do
                    controller.params[:dietary_labels] = 'high-protein'
                    filtered_recipes = recipes.find(1)
                end.wont_equal og_recipes
            end
        end

        it 'fails to find recipes if bogus label' do
            VCR.use_cassette('recipes') do
                recipes = EdamamRecipe.new('tofu')
                proc do
                    controller.params[:dietary_labels] = 'high-bogus'
                    bogus_label = recipes.find(1)
                    bogus_label.must_be_empty
                end
            end
        end
    end
end
