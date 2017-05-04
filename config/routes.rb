Rails.application.routes.draw do

  root 'recipes#search'

  get '/recipes/:search_term', to: 'recipes#index', as: 'recipes'

  get '/recipes/:recipe_id', to: 'recipes#show', as: 'recipe'

end
