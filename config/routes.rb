Rails.application.routes.draw do
  root 'home#index'

  get '/recipes/:search', to: 'recipes#index', as: 'recipes'
  get '/recipes/:uri', to: 'recipes#show', as: 'recipe'
end
