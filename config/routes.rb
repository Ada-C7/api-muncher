Rails.application.routes.draw do
  root "recipes#find"
  get '/recipes/search', to: 'recipes#find', as: 'recipe_find'
  get '/recipes/index', to: 'recipes#index', as: 'recipes'
  get '/recipe/:uri', to: 'recipes#show', as: 'recipe'
end
