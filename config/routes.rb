Rails.application.routes.draw do
  root 'homepages#index'

  get '/recipes', to: 'homepages#list', as: 'list_recipes'
  get '/recipes/:recipe_id', to: 'homepages#show', as: 'show_recipe'
end
