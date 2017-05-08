Rails.application.routes.draw do
  root to: 'recipes#index'
  post '/', to: 'recipes#search', as: 'search'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
end
