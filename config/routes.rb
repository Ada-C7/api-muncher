Rails.application.routes.draw do

  get '/recipes', to: 'recipes#index', as: 'recipes'

  get '/recipes/get_recipes', to: 'recipes#get_recipes', as: 'get_recipes'
end
