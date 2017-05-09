require 'test_helper'

describe RecipesController do
    DIET_LABELS = ['balanced', 'high-protein', 'high-fiber', 'low-fat', 'low-carb', 'low-sodium'].freeze

    describe 'index' do
        it 'succeeds for a provided search term' do
            VCR.use_cassette('recipes') do
                get recipes_path(1), params: { search_term: 'tofu' }
                must_respond_with :success
            end
        end

        it 'redirects for invalid/bogus search term' do
            VCR.use_cassette('recipes') do
                get recipes_path(1), params: { search_term: '' }
                must_redirect_to root_path

                get recipes_path(1), params: { search_term: 'kehfslehoirjb' }
                must_redirect_to root_path

                get recipes_path(1), params: { search_term: "*$&@*\#$(*@)}" }
                must_redirect_to root_path
            end
        end

        it 'succeeds for a diet label with recipes' do
            VCR.use_cassette('recipes') do
                DIET_LABELS.each do |label|
                    get recipes_path(1), params: { search_term: 'tofu', dietary_labels: [label] }
                    must_respond_with :success
                end
            end
        end

        it 'succeeds for a diet label with no recipes' do
            VCR.use_cassette('recipes') do
                # For some reason almost nothing is labeled low-sugar
                get recipes_path(1), params: { search_term: 'pie', dietary_labels: ['low-sugar'] }
                must_respond_with :success
            end
        end
    end

    describe 'show' do
        it 'succeeds for a exsisting URI' do
            VCR.use_cassette('recipes') do
                get recipe_path(uri: 'http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2')
                must_respond_with :success
            end
        end

        it 'renders 404 for bogus URI' do
            skip
            # API returns bad Array
            VCR.use_cassette('recipes') do
                get recipe_path(uri: 'bogus')
                must_respond_with :not_found
            end
        end
    end
end
