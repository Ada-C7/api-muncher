Rails.application.routes.draw do

root 'recipes#search', as: "recipe_search"

  get 'recipes/', to: "recipes#index", as: "recipes"

  # get 'recipes/search', to: "recipes#search", as: "recipe_search"

  get 'recipes/:uri', to: "recipes#show", as: "recipe"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# make route for show
# make show controller and pass in uri
# make show.html.erb page
# got to index page and parse uri with partition after #
# make a recipe_uri with uri you want to get with http party
# http://www.edamam.com/ontologies/edamam.owl#recipe_8186c5dc8eb410aca7b2eada11a8f5f6
