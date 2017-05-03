Rails.application.routes.draw do
  root to: 'recipes#index'
  # get 'recipes', to: 'recipes#index', as: 'recipes'
  post '/', to: 'recipes#search'
  # get 'search', to: 'recipes#search', as: 'search'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
end
