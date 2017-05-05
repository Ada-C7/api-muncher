Rails.application.routes.draw do
  root to: 'recipes#index'
  post '/', to: 'recipes#search'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
end
