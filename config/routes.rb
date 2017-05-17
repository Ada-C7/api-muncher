Rails.application.routes.draw do
  root 'recipes#new'

  get 'recipes/', to: 'recipes#index', as: 'recipes'

  get 'recipes/:name', to: 'recipes#show', as: 'recipe'
end
