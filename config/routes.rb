Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/recipes', to: 'recipes#index', as: 'recipes'
get '/recipes/:recipe/show', to: 'recipes#show', as: 'recipe'
get '/recipes/:search_text', to: 'recipe#search', as: 'search'

end
