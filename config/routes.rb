Rails.application.routes.draw do
  root 'home#index'

  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/:uri', to: 'recipes#show', as: 'recipe'
end
